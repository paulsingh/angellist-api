require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :faraday
  c.configure_rspec_metadata!
  c.default_cassette_options = {
    :record => :once,
    :match_requests_on => [:method, :uri_with_unordered_params]
  }

  # In recorded cassettes, replace these environment variable values with a
  # placeholder like <VARIABLE>
  placeholders = %w[
    ANGELLIST_ACCESS_TOKEN
  ]

  placeholders.each do |placeholder|
    c.filter_sensitive_data("<#{placeholder}>") { ENV[placeholder] }
  end

  # Between Faraday 0.8.x and 0.9, they started sorting the order of params when
  # generating URIs:
  #
  #   https://github.com/lostisland/faraday/issues/353
  #
  # The AngelList API should not care about query param ordering. Since
  # Faraday's fate seems to be in question anyway [1], rather than bump our
  # dependency requirement for now, a less strict request matcher works around
  # the discrepancy for the test suite. Hat tip:
  #
  #    https://github.com/vcr/vcr/wiki/Common-Custom-Matchers#uri-ignoring-query-parameter-ordering
  #
  # [1]: https://github.com/lostisland/faraday/issues/454
  c.register_request_matcher :uri_with_unordered_params do |req1, req2|
    uri1, uri2 = URI(req1.uri), URI(req2.uri)
    uri1.scheme == uri2.scheme && uri1.host == uri2.host &&
      uri1.path == uri2.path &&
        CGI.parse(uri1.query || '') == CGI.parse(uri2.query || '')
  end
end

