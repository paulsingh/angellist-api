require 'simplecov'
SimpleCov.start

require 'rspec'
require 'angellist_api'
require 'timecop'

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.syntax = [:should, :expect]
  end

  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
  config.color = true

  config.expect_with :rspec do |rspec|
    rspec.syntax = [:should, :expect]
  end
end

Dir['./spec/support/**/*.rb'].each { |f| require f }

ROLES = %w[founder employee past_investor advisor incubator referrer customer]
