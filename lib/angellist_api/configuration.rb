require 'angellist_api/version'

module AngellistApi
  # Defines constants and methods related to configuration
  module Configuration
    # An array of valid keys in the options hash when configuring a {AngellistApi::API}
    VALID_OPTIONS_KEYS = [
      :adapter,
      :endpoint,
      :gateway,
      :access_token,
      :proxy,
      :user_agent,
      :faraday_options].freeze

    # The adapter that will be used to connect if none is set
    DEFAULT_ADAPTER = :net_http

    # The endpoint that will be used to connect if none is set
    DEFAULT_ENDPOINT = "https://api.angel.co/".freeze

    # By default, don't set a user oauth access token
    DEFAULT_ACCESS_TOKEN = nil

    # By default, don't use a proxy server
    DEFAULT_PROXY = nil

    # The value sent in the 'User-Agent' header if none is set
    DEFAULT_USER_AGENT = "AngellistApi Ruby Gem #{AngellistApi::VERSION}".freeze

    DEFAULT_GATEWAY = nil

    DEFAULT_FARADAY_OPTIONS = {}.freeze

    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    # Create a hash of options and their values
    def options
      options = {}
      VALID_OPTIONS_KEYS.each{|k| options[k] = send(k)}
      options
    end

    # Reset all configuration options to defaults
    def reset
      self.adapter            = DEFAULT_ADAPTER
      self.endpoint           = DEFAULT_ENDPOINT
      self.access_token       = DEFAULT_ACCESS_TOKEN
      self.proxy              = DEFAULT_PROXY
      self.user_agent         = DEFAULT_USER_AGENT
      self.gateway            = DEFAULT_GATEWAY
      self.faraday_options    = DEFAULT_FARADAY_OPTIONS
      self
    end
  end
end
