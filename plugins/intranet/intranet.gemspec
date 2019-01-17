$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "intranet/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "intranet"
  s.version     = Intranet::VERSION
  s.authors     = ["gabrieelgomez"]
  s.email       = ["gagg1707@gmail.com"]
  s.homepage    = "https://www.google.co.ve/"
  s.summary     = "Intranet Engine"
  s.description = "Intranet Ewave"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "5.1.6"

  s.add_development_dependency "pg"
end
