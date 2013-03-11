require 'simplecov'
SimpleCov.start

require 'rspec'
require 'angel_list'
require 'timecop'

RSpec.configure do |config|
  config.mock_with :rspec

  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
  config.color_enabled = true
  config.treat_symbols_as_metadata_keys_with_true_values = true
end

Dir['./spec/support/**/*.rb'].each { |f| require f }

