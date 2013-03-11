require 'faraday'
require 'faraday_middleware'
require 'angel_list/core_ext/hash'
require 'angel_list/request/multipart_with_file'
require 'angel_list/request/gateway'
require 'angel_list/request/angel_list_oauth'
require 'angel_list/response/raise_client_error'
require 'angel_list/response/raise_server_error'

module AngelList
  module Connection
    private

    # Returns a Faraday::Connection object
    #
    # @param options [Hash] A hash of options
    # @return [Faraday::Connection]
    def connection(options={})
      default_options = {
        :headers => {
          :accept => 'application/json',
          :user_agent => user_agent
        },
        :proxy => proxy,
        :ssl => {:verify => false},
        :url => options.fetch(:endpoint, api_endpoint)
      }

      @connection ||= Faraday.new(connection_options.deep_merge(default_options)) do |builder|
        builder.use AngelList::Request::MultipartWithFile
        builder.use AngelList::Request::AngelListOAuth, authentication if authenticated?
        builder.use Faraday::Request::Multipart
        builder.use Faraday::Request::UrlEncoded
        builder.use AngelList::Request::Gateway, gateway if gateway
        builder.use AngelList::Response::RaiseClientError
        builder.use Faraday::Response::Mashify
        builder.use Faraday::Response::ParseJson
        builder.use AngelList::Response::RaiseServerError
        builder.adapter(adapter)
      end

      @connection
    end
  end
end

