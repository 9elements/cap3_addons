# Cap3Addons

Additions that can be pulled into your capistrano 3 setup.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cap3_addons'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cap3_addons

## Usage

Each component is activated individually by loading the corresponding rake file into your deploy.rb.
Depending on the component, additional configuration may be necessary.

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
