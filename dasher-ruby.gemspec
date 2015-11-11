$:.push File.expand_path("../lib", __FILE__)

require "dasher/version"

Gem::Specification.new do |s|
  s.name        = "dasher-ruby"
  s.version     = Dasher::VERSION
  s.authors     = ["Adam Cooke"]
  s.email       = ["adam@atechmedia.com"]
  s.homepage    = "https://dasherapp.com"
  s.summary     = "A Ruby client library for the Dasher API."
  s.description = "A full client library allows requests to made to the Dasher API."
  s.files = Dir["{lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.add_dependency "moonrope-client", ">= 1.0.2", "< 2.0"
  s.licenses    = ["MIT"]
end
