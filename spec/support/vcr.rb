require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :faraday
  c.configure_rspec_metadata!
  c.default_cassette_options = { :record => :once }
end

