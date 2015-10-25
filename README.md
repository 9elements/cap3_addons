# Cap3Addons

Additions that can be pulled into your capistrano 3 setup.

## Installation

Add this line to your Rails application's Gemfile, inside the `:development` group:

```ruby
gem 'cap3_addons'
```

And then execute:

    $ bundle

## Usage

This gem provides different pieces of functionality that is each being made
available by loading a Rake file from you `deploy.rb` and using the provided tasks.
This way, when new components are added to this gem, they will not interfere with you existing
workflow.

The added tasks can be made dependencies of existing tasks, or `after` hooks can be used for them.
Some tasks require additional configuration. See the following sections for details.

### Deploytags

Load the rake file:

```ruby
load 'cap3_addons/tasks/deploytags.rake'
```
Then, configure these tasks to be run:

```
after :deploy, "deploytags:tag"
after :deploy, "deploytags:clean"
```

When cleaning tags, some hard-coded assumptions are made about how many tags and from what time you want to keep. Tags considered obsolete are removed locally and from the remote "origin".

Known issues: very noisy.

### Check branch

Load the rake file:

```ruby
load 'cap3_addons/tasks/checkbranch.rake'
```
Then, configure these tasks to be run:

```
before :deploy, :checkbranch
```

Comparison is done against the same branch in the "origin" remote.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cap3_addons/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
