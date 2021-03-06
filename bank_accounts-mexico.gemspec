# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bank_accounts/mexico/version'

Gem::Specification.new do |spec|
  spec.name          = "bank_accounts-mexico"
  spec.version       = BankAccounts::Mexico::VERSION
  spec.authors       = ["Carlos Gottberg"]
  spec.email         = ["42linoge@gmail.com"]

  spec.summary       = %q{A gem containing Mexican bank accounts data}
  spec.description   = %q{National bank codes of Mexico}
  spec.homepage      = "https://github.com/clinoge/bank_accounts-mexico"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
