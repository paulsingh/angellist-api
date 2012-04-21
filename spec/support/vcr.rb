require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :faraday
  c.default_cassette_options = { :record => :once }
end

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
end

