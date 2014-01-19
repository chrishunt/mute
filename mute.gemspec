# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mute/version'

Gem::Specification.new do |spec|
  spec.name          = "mute"
  spec.version       = Mute::VERSION
  spec.authors       = ["Chris Hunt"]
  spec.email         = ["c@chrishunt.co"]
  spec.summary       = %q{Muting test suites since 2014}
  spec.description   = %q{Muting test suites since 2014}
  spec.homepage      = "https://github.com/chrishunt/mute"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler',        '~> 1.5'
  spec.add_development_dependency 'cane',           '~> 2.6.1'
  spec.add_development_dependency 'cane-hashcheck', '~> 1.2.0'
  spec.add_development_dependency 'coveralls',      '~> 0.7.0'
  spec.add_development_dependency 'pry',            '~> 0.9.12'
  spec.add_development_dependency 'rake',           '~> 10.1.1'
  spec.add_development_dependency 'rspec',          '~> 2.14.1'
end
