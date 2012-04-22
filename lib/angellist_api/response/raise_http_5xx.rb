require 'faraday'
require 'angellist_api/error/bad_gateway'
require 'angellist_api/error/internal_server_error'
require 'angellist_api/error/service_unavailable'

module AngellistApi
  module Response
    class RaiseHttp5xx < Faraday::Response::Middleware
      def on_complete(env)
        case env[:status].to_i
        when 500
          raise AngellistApi::Error::InternalServerError.new(error_message(env, "Something is technically wrong."), env[:response_headers])
        when 502
          raise AngellistApi::Error::BadGateway.new(error_message(env, "AngellistApi is down or being upgraded."), env[:response_headers])
        when 503
          raise AngellistApi::Error::ServiceUnavailable.new(error_message(env, "(__-){ AngellistApi is over capacity."), env[:response_headers])
        end
      end

      private

      def error_message(env, body=nil)
        "#{env[:method].to_s.upcase} #{env[:url].to_s}: #{[env[:status].to_s + ':', body].compact.join(' ')} You should follow @angellistapi for frequent updates. And please, send your feedback to api@angel.co. Happy hacking!"
      end
    end
  end
end
