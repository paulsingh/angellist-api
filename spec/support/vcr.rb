require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :faraday
  c.configure_rspec_metadata!
  c.default_cassette_options = { :record => :once }

  # In recorded cassettes, replace these environment variable values with a
  # placeholder like <VARIABLE>
  placeholders = %w[
    ANGELLIST_ACCESS_TOKEN
  ]

  placeholders.each do |placeholder|
    c.filter_sensitive_data("<#{placeholder}>") { ENV[placeholder] }
  end
end

