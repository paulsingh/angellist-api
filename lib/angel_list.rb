require 'angel_list/client'
require 'angel_list/configuration'

module AngelList
  extend Configuration

  class << self
    # Alias for AngelList::Client.new
    #
    # @return [AngelList::Client]
    def new(options={})
      AngelList::Client.new(options)
    end

    # Delegate to AngelList::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end

