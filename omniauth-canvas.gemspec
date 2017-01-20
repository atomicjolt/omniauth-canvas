# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "omniauth-canvas/version"

Gem::Specification.new do |gem|
  gem.name          = "omniauth-canvas"
  gem.version       = OmniAuth::Canvas::VERSION
  gem.authors       = "Justin Ball"
  gem.email         = "justin@atomicjolt.com"
  gem.description   = "OmniAuth Oauth2 strategy for Instructure Canvas."
  gem.summary       = "OmniAuth Oauth2 strategy for Instructure Canvas."
  gem.homepage      = "https://github.com/atomicjolt/omniauth-canvas"
  gem.license       = "MIT"

  gem.required_ruby_version = ">= 2.0"

  gem.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  gem.test_files = Dir["test/**/*"]

  gem.require_paths = ["lib"]

  gem.add_dependency "omniauth", "~> 1.3.1"
  gem.add_dependency "omniauth-oauth2", "~> 1.4.0"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rack-test"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "byebug"
end
