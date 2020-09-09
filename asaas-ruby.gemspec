# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'asaas/version'

Gem::Specification.new do |spec|
  spec.name          = "asaas-ruby"
  spec.version       = Asaas::VERSION
  spec.authors       = ["Marcos Junior"]
  spec.email         = ["marcos@maini.com.br"]

  spec.summary       = %q{Asass.com Ruby API Wrapper}
  spec.description   = %q{Asass.com Ruby API Wrapper}
  spec.homepage      = "http://github.com/marcosgugs/asaas-ruby"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "webmock", "~> 3.7.2"


  spec.add_dependency "activesupport", "6.0.3.3"
  spec.add_dependency "virtus", '~> 1.0', "~> 1.0.5"
  spec.add_dependency "dry-types", '0.15.0'
  spec.add_dependency "dry-struct", '0.7.0'
  spec.add_dependency "dry-monads", '1.2.0'
  spec.add_dependency "typhoeus", '~> 1.0', "~> 1.0.2"
  spec.add_dependency "rest-client", '~> 1.8', "~> 1.8.0"
  spec.add_dependency "awesome_print", '~> 1.6', "~> 1.6.1"
end
