# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "acts_as_random_id/version"

Gem::Specification.new do |s|
  s.name        = "acts_as_random_id"
  s.version     = ActsAsRandomId::VERSION
  s.authors     = ["Shaliko Usubov"]
  s.email       = ["shaliko@ezid.ru"]
  s.homepage    = "https://github.com/shaliko/acts_as_random_id"
  s.summary     = %q{Generating random id}
  s.description = %q{Random ID generator}

  s.rubyforge_project = "acts_as_random_id"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_development_dependency "rspec"
  s.add_development_dependency "supermodel"
  s.add_development_dependency "rake", '0.9.2.2'
end
