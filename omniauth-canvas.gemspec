# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-canvas/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = "Justin Ball"
  gem.email         = "justin@atomicjolt.com"
  gem.description   = %q{OmniAuth Oauth2 strategy for Instructure Canvas.}
  gem.summary       = %q{OmniAuth Oauth2 strategy for Instructure Canvas.}
  gem.homepage      = "https://github.com/atomicjolt/omniauth-canvas"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-canvas"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Canvas::VERSION

  gem.add_dependency 'omniauth', '~> 1.2.2'
  gem.add_dependency 'omniauth-oauth2', '~> 1.3.0'
end