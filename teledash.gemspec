$:.push File.expand_path("../lib", __FILE__)

require "teledash/version"

Gem::Specification.new do |s|
  s.name        = "viaduct-api"
  s.version     = Teledash::VERSION
  s.authors     = ["Adam Cooke"]
  s.email       = ["adam@atechmedia.com"]
  s.homepage    = "http://teledash.io"
  s.summary     = "A Ruby client library for the Teledash API."
  s.description = "A full client library allows requests to made to the Teledash API."
  s.files = Dir["{lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.add_dependency "moonrope-client", "~> 1.0.2"
  s.licenses    = ["MIT"]
end
