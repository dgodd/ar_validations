# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ar_validations/version"

Gem::Specification.new do |s|
  s.name        = "ar_validations"
  s.version     = ArValidations::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Dave Goddard"]
  s.email       = ["ar_validations"]
  s.homepage    = "https://github.com/dgodd/ar_validations"
  s.summary     = %q{Set ActiveRecord Validates based upon database reflection}
  s.description = %q{Set ActiveRecord Validates based upon database reflection}
  s.licenses    = ["MIT"]

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'activerecord', '>=3'
  s.add_dependency 'activesupport', '>=3'
end
