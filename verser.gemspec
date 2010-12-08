# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "verser/version"

Gem::Specification.new do |s|
  s.name        = "verser"
  s.version     = Verser::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Rawane ZOSSOU"]
  s.email       = ["dev@raw1z.fr"]
  s.homepage    = "http://rubygems.org/gems/verser"
  s.summary     = %q{Verser is a bible verse/chapter reference parser}
  s.description = %q{Verser is a bible verse/chapter reference parser}

  s.rubyforge_project = "verser"
  s.add_development_dependency("rspec")

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
