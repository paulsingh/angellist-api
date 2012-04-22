require 'angellist_api/authentication'
require 'angellist_api/configuration'
require 'angellist_api/connection'
require 'angellist_api/request'

module AngellistApi
  class API
    include Authentication
    include Connection
    include Request

    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    # Creates a new API
    def initialize(options={})
      options = AngellistApi.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end
  end
end
