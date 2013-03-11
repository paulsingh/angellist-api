$:.push File.expand_path("../lib", __FILE__)

require "angel_list/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "angel_list"
  s.version     = AngelList::VERSION
  s.authors     = ["Paul Singh", "Ches Martin"]
  s.email       = ["paul@resultsjunkies.com", "ches@whiskeyandgrits.net"]
  s.homepage    = "https://github.com/paulsingh/angellist-api"
  s.summary     = "Ruby wrapper for the Angellist API."
  s.description = "Ruby wrapper for the Angellist API. The AngelList API provides developers with a RESTful interface to the AngelList data set. Some endpoints are public and require no authentication."

  s.files = Dir["lib/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md", "CHANGELOG.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'hashie', '>= 1.1.0'
  s.add_dependency 'faraday', '~> 0.7'
  s.add_dependency 'faraday_middleware', '~> 0.7'
  s.add_dependency 'multi_json', '~> 1.0'

  s.add_development_dependency "rdiscount", "~> 2.0"
  s.add_development_dependency "rspec",     "~> 2.7"
  s.add_development_dependency "simplecov", "~> 0.7"
  s.add_development_dependency "timecop",   "~> 0.6"
  s.add_development_dependency "vcr",       "~> 2.1"
  s.add_development_dependency "yard",      "~> 0.8"
end

