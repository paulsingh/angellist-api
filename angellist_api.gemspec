$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "angellist_api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "angellist_api"
  s.version     = AngellistApi::VERSION
  s.authors     = ["Paul Singh"]
  s.email       = ["paul@resultsjunkies.com"]
  s.homepage    = "https://github.com/paulsingh/angellist-api"
  s.summary     = "Ruby wrapper for the Angellist API."
  s.description = "Ruby wrapper for the Angellist API. The AngelList API provides developers with a RESTful interface to the AngelList data set. Some endpoints are public and require no authentication."

  s.files = Dir["lib/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'hashie', '>= 1.1.0'
  s.add_dependency 'faraday', '~> 0.7.4'
  s.add_dependency 'faraday_middleware', '~> 0.7.0'
  s.add_dependency 'multi_json', '~> 1.0.0'

  s.add_development_dependency "mocha",     "~> 0.10.0"
  s.add_development_dependency "rdiscount", "~> 1.6.8"
  s.add_development_dependency "rspec",     "~> 2.7.0"
  s.add_development_dependency "simplecov", "~> 0.5.4"
  s.add_development_dependency "timecop",   "~> 0.3.5"
  s.add_development_dependency "yard",      "~> 0.7.3"
end

