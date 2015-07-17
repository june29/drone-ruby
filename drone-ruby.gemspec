# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'drone/version'

Gem::Specification.new do |spec|
  spec.name          = "drone-ruby"
  spec.version       = Drone::VERSION
  spec.authors       = ["june29"]
  spec.email         = ["june29.jp@gmail.com"]

  spec.summary       = "API client for Drone.io"
  spec.homepage      = "https://github.com/june29/drone-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httpclient"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "webmock"
end
