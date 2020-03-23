$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "wave_citizen/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "wave_citizen"
  s.version     = WaveCitizen::VERSION
  s.authors     = ["gabrielgomez"]
  s.email       = ["gagg1707@gmail.com"]
  s.homepage    = "https://www.google.co.ve/"
  s.summary     = "Wave Citizen: Summary of WaveCitizen."
  s.description = "Wave Citizen: Description of WaveCitizen."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6"

  s.add_development_dependency "sqlite3"
end
