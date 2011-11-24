# -*- encoding: utf-8 -*-
$:.push File.expand_path("lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "bouncing_ball"
  s.version     = "0.0.1"
  s.authors     = ["Andrew Nordman"]
  s.email       = ["cadwallion@gmail.com"]
  s.homepage    = "https://github.com/cadwallion/bouncing_ball"
  s.summary     = %q{Format and validate a URL in Active Record}
  s.description = %q{Demonstration of bouncing ball in Gosu}

  s.rubyforge_project = "bouncing_ball"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "gosu"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
end
