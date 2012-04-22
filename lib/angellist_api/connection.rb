require 'faraday'
require 'faraday_middleware'
require 'angellist_api/core_ext/hash'
require 'angellist_api/request/multipart_with_file'
require 'angellist_api/request/gateway'
require 'angellist_api/request/angellist_api_oauth'
require 'angellist_api/response/raise_client_error'
require 'angellist_api/response/raise_server_error'

module AngellistApi
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
        builder.use AngellistApi::Request::MultipartWithFile
        builder.use AngellistApi::Request::AngellistApiOAuth, authentication if authenticated?
        builder.use Faraday::Request::Multipart
        builder.use Faraday::Request::UrlEncoded
        builder.use AngellistApi::Request::Gateway, gateway if gateway
        builder.use AngellistApi::Response::RaiseClientError
        builder.use Faraday::Response::Mashify
        builder.use Faraday::Response::ParseJson
        builder.use AngellistApi::Response::RaiseServerError
        builder.adapter(adapter)
      end

      @connection
    end
  end
end

