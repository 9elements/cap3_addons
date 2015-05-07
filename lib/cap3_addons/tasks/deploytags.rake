namespace :deploytags do
  task :tag do
    stage = fetch(:stage).to_s
    raise "stage named #{stage.inspect} contains a minus sign," \
      "won't be able to parse deploy tags correctly" if stage.include?("-")

    tag = "#{stage}-#{Time.new.strftime('%Y.%m.%d-%H%M%S')}"
    run_locally do
      execute :git, :tag, tag, fetch(:branch)
      execute :git, :push, :origin, tag
    end
  end

  task :clean do
    require 'active_support/core_ext/numeric/time'
    require 'active_support/core_ext/date/calculations'
    require 'active_support/core_ext/time/calculations'

    run_locally do
      execute :git, :fetch, '--tags'

      tags = capture(:git, :tag).split

      stage = fetch(:stage)

      tags = tags.grep(/^#{Regexp.quote stage}-\d/).sort.reverse

      limit_tag = "#{stage}-#{48.days.ago.strftime('%Y.%m.%d-%H%M%S')}"
      keep_tags = tags.select { |tag| tag > limit_tag }
      keep_tags = tags.take(10) if keep_tags.length < 10

      (tags - keep_tags).each do |tag|
        execute :git, :tag, '-d', tag
        execute :git, :push, :origin, ":#{tag}", raise_on_non_zero_exit: false
      end
    end
  end
end

