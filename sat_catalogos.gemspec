$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sat_catalogos/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sat_catalogos"
  s.version     = SatCatalogos::VERSION
  s.authors     = ["Edwin Cruz", "Ernesto Alcaraz", "Jonathan Tapia", "Ismael Marin"]
  s.email       = ["developers@magmalabs.io"]
  s.homepage    = "http://www.magmalabs.io"
  s.summary     = "Provee endpoints con la informacion del SAT(catalogos)"
  s.description = "Rails engine montable que provee los catalogos de SAT facilmente"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 3.2.13"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rack", "> 1.4.5"
end
