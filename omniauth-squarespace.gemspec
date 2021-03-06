# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-squarespace/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = "omniauth-squarespace"
  gem.version     = OmniAuth::SQUARESPACE::VERSION
  gem.authors     = ["Cristhian Ferreira"]
  gem.email       = ["cristhian@codemera.com"]
  gem.homepage    = ""
  gem.summary     = %q{OmniAuth strategy for SQUARESPACE }
#   gem.description = %q{OmniAuth strategy for squarespace, see https://github.com/squarespace/omniauth-squarespace for examples and more information.}
  gem.license = 'MIT'

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.1'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'

end