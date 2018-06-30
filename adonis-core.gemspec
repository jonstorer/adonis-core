$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "adonis/core/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "adonis-core"
  s.version     = Adonis::Core::VERSION
  s.authors     = ["Jonathon Storer"]
  s.email       = ["JonathonStorer@legalshieldcorp.com"]
  s.homepage    = "https://github.com/jonstorer/adonis-core"
  s.summary     = "Summary of Adonis::Core."
  s.description = "Description of Adonis::Core."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.1"

  s.add_development_dependency "sqlite3"
end
