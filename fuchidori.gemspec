$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "fuchidori/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "fuchidori"
  s.version     = Fuchidori::VERSION
  s.authors     = ["aki77"]
  s.email       = ["aki77@users.noreply.github.com"]
  s.homepage    = "https://github.com/aki77/fuchidori"
  s.summary     = "Public pages management with Asset Pipeline"
  s.description = "Fuchidori provides a simple way to manage public pages with Asset Pipeline."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 5.1.0"

  s.add_development_dependency "sqlite3"
end
