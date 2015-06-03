# -*- encoding: utf-8 -*-
require File.expand_path('../lib/docbuilder/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Rob Bazinet", "Francisco Guzman"]
  gem.email         = ["rbazinet@docbuilder.io", "fguzman@docbuilder.io"]
  gem.description   = "A ruby wrapper for the DocBuilder API."
  gem.summary       = "A ruby wrapper for the DocBuilder API."
  gem.homepage      = "http://docbuilder.io"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "docbuilder"
  gem.require_paths = ["lib"]
  gem.version       = DocBuilder::VERSION

  # gem.add_dependency('httparty', ["< 1.0", ">= 0.5"])
  gem.add_dependency('httmultiparty', ["<0.3.16", ">=0.3.12"])

  gem.add_development_dependency('rake')
  gem.add_development_dependency('rspec')
  gem.add_development_dependency('fakeweb')
end