# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zipsy/version'

Gem::Specification.new do |gem|
  gem.name          = "zipsy"
  gem.version       = Zipsy::VERSION
  gem.authors       = ["Andrew Kane"]
  gem.email         = ["acekane1@gmail.com"]
  gem.description   = %q{US zip code data without external dependencies}
  gem.summary       = %q{US zip code data without external dependencies}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
  gem.add_development_dependency "tzip"
  gem.add_development_dependency "test-unit"
end
