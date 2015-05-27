# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'heroku_line_item_billing/version'

Gem::Specification.new do |spec|
  spec.name          = "heroku_line_item_billing"
  spec.version       = HerokuLineItemBilling::VERSION
  spec.authors       = ["Nicholas Silva", "Nicky Leach"]
  spec.email         = ["nick@silvamerica.com", "npl922@gmail.com"]
  spec.summary       = %q{Object-ize Heroku Billing API Information and Upload to S3}
  spec.description   = %q{Object-ize Heroku Billing API Information and Upload to S3}
  spec.homepage      = "https://github.com/IFTTT/heroku_line_item_billing"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "~> 4.2.1"
  spec.add_dependency "platform-api", "~> 0.2.0"
  spec.add_dependency "aws-sdk", "~> 2.0"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
