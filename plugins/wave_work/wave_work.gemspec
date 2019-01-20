$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "wave_work/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "wave_work"
  s.version     = WaveWork::VERSION
  s.authors     = ["gabrielgomez"]
  s.email       = ["gagg1707@gmail.com"]
  s.homepage    = "https://www.google.co.ve/"
  s.summary     = "Summary of WaveWork."
  s.description = "Description of WaveWork."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6"

  s.add_development_dependency "sqlite3"
end
