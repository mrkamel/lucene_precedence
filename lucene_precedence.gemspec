
$:.push File.expand_path("../lib", __FILE__)
require "lucene_precedence/version"

Gem::Specification.new do |s|
  s.name        = "lucene_precedence"
  s.version     = LucenePrecedence::VERSION
  s.authors     = ["Benjamin Vetter"]
  s.email       = ["vetter@flakks.com"]
  s.homepage    = ""
  s.summary     = %q{Fixing Lucene operator precedence}
  s.description = %q{Fixes Lucene's OR operator precedence by using groups}

  s.rubyforge_project = "lucene_precedence"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rake"
end

