require 'simplecov'
SimpleCov.start

require 'rspec'
require 'angellist_api'

RSpec.configure do |config|
  config.mock_with :mocha

  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
  config.color_enabled = true
end