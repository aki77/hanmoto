$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "hanmoto/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "hanmoto"
  s.version     = Hanmoto::VERSION
  s.authors     = ["aki77"]
  s.email       = ["aki77@users.noreply.github.com"]
  s.homepage    = "https://github.com/aki77/hanmoto"
  s.summary     = "Public pages management with Asset Pipeline"
  s.description = "Hanmoto provides a simple way to manage public pages with Asset Pipeline."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.required_ruby_version = '>= 2.7.0'

  s.add_dependency "rails", ">= 6.0.5"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "haml-rails"
end
