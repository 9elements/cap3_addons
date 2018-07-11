# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cap3_addons/version'

Gem::Specification.new do |spec|
  spec.name          = "cap3_addons"
  spec.version       = Cap3Addons::VERSION
  spec.authors       = ["Thomas Stratmann"]
  spec.email         = ["thomas.stratmann@9elements.com"]

  spec.summary       = %q{Additions that can be pulled into your capistrano 3 setup}
  spec.description   = %q{Additions that can be pulled into your capistrano 3 setup}
  spec.homepage      = "https://github.com/9elements/cap3_addons"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
