# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fizzbuzz/version'

Gem::Specification.new do |spec|
  spec.name          = "fizzbuzz"
  spec.version       = Fizzbuzz::VERSION
  spec.authors       = ["Yamane Ryota"]
  spec.email         = ["fuz17351@kwansei.ac.jp"]

  spec.summary       = %q{FizzBuzz: Write a short summary, because Rubygems requires one.}
  spec.description   = %q{FizzBuzz: Write a longer description or delete this line.}
  spec.homepage      = "FizzBuzz: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "FizzBuzz: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "yard","~>0.8"
  spec.add_development_dependency "redcarpet","~>2.2"
  spec.add_dependency "activerecord","~> 3.2.0"
  spec.add_dependency "sqlite3","~> 1.3.0"
  spec.add_development_dependency "bundler","~> 1.3"
end
