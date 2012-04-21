require 'simplecov'
SimpleCov.start

require 'rspec'
require 'angellist_api'
require 'timecop'

Dir['./spec/support/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec

  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
  config.color_enabled = true
end

