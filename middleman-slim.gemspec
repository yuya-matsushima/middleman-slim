# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman-slim/version'

Gem::Specification.new do |spec|
  spec.name          = "middleman-slim"
  spec.version       = Middleman::Slim::VERSION
  spec.authors       = ["yterajima"]
  spec.email         = ["terra@e2esound.com"]
  spec.description   = %q{A Middleman template using Slim.}
  spec.summary       = %q{A Middleman template using Slim.}
  spec.homepage      = "https://github.com/yterajima/middleman-slim"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "slim", ">= 2.0"
  spec.add_runtime_dependency "middleman", ">= 3.2"

  spec.add_development_dependency "cucumber", ">= 1.3"
  spec.add_development_dependency "aruba", ">= 0.6"
end
