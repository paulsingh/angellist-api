require 'angellist_api/api'
require 'angellist_api/client'
require 'angellist_api/configuration'
require 'angellist_api/error'

module AngellistApi
  extend Configuration
  class << self
    # Alias for AngellistApi::Client.new
    #
    # @return [AngellistApi::Client]
    def new(options={})
      AngellistApi::Client.new(options)
    end

    # Delegate to AngellistApi::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end