require 'angel_list/authentication'
require 'angel_list/configuration'
require 'angel_list/connection'
require 'angel_list/request'

module AngelList
  class API
    include Authentication
    include Connection
    include Request

    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    # Creates a new API
    def initialize(options={})
      options = AngelList.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end
  end
end

