# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rack/proxy/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Adam Jahn"]
  gem.email         = ["ajjahn@gmail.com"]
  gem.description   = %q{A Rack App compatible HTTP Proxy}
  gem.summary       = %q{A Rack App compatible HTTP Proxy}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rackproxy"
  gem.require_paths = ["lib"]
  gem.version       = Rack::Proxy::VERSION
  
  gem.add_development_dependency 'rake'
  gem.add_dependency 'rack', '~> 1.4.1'
end
