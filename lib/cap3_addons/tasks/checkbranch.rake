desc "Check if remote branch coincides with local branch"
task :checkbranch do
  run_locally do
    remote_sha = capture(:git, :'ls-remote', :origin, fetch(:branch)).split.first
    local_sha = capture(:git, :'rev-parse', fetch(:branch)).chomp
    remote_sha == local_sha or raise("Did you forget to push?")
  end
end

