# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dominance/version'

Gem::Specification.new do |gem|
  gem.name          = "dominance"
  gem.version       = Dominance::VERSION
  gem.authors       = ["Mattias Putman"]
  gem.email         = ["mattias.putman@gmail.com"]
  gem.description   = %q{One test that dominates them all}
  gem.summary       = %q{Easily execute only one test out of a test file. Currently supports only minitest/spec}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
