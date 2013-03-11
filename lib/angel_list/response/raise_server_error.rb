require 'faraday'
require 'angel_list/error/bad_gateway'
require 'angel_list/error/internal_server_error'
require 'angel_list/error/service_unavailable'

module AngelList
  module Response
    class RaiseServerError < Faraday::Response::Middleware
      def on_complete(env)
        case env[:status].to_i
        when 500
          raise AngelList::Error::InternalServerError.new(error_message(env, "Something is technically wrong."), env[:response_headers])
        when 502
          raise AngelList::Error::BadGateway.new(error_message(env, "AngelList is down or being upgraded."), env[:response_headers])
        when 503
          raise AngelList::Error::ServiceUnavailable.new(error_message(env, "(__-){ AngelList is over capacity."), env[:response_headers])
        end
      end

      private

      def error_message(env, body=nil)
        "#{env[:method].to_s.upcase} #{env[:url].to_s}: #{[env[:status].to_s + ':', body].compact.join(' ')} You should follow @angellistapi for frequent updates. And please, send your feedback to api@angel.co. Happy hacking!"
      end
    end
  end
end

