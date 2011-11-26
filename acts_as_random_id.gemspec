# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "acts_as_random_id/version"

Gem::Specification.new do |s|
  s.name        = "acts_as_random_id"
  s.version     = ActsAsRandomId::VERSION
  s.authors     = ["Shaliko Usubov"]
  s.email       = ["shaliko@ezid.ru"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "acts_as_random_id"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_development_dependency "rspec"
  s.add_development_dependency "supermodel"
end
