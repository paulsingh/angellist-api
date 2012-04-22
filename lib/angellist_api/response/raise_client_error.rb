require 'faraday'
require 'angellist_api/error/bad_request'
require 'angellist_api/error/enhance_your_calm'
require 'angellist_api/error/forbidden'
require 'angellist_api/error/not_acceptable'
require 'angellist_api/error/not_found'
require 'angellist_api/error/unauthorized'

module AngellistApi
  module Response
    class RaiseClientError < Faraday::Response::Middleware
      def on_complete(env)
        case env[:status].to_i
        when 400
          raise AngellistApi::Error::BadRequest.new(error_message(env), env[:response_headers])
        when 401
          raise AngellistApi::Error::Unauthorized.new(error_message(env), env[:response_headers])
        when 403
          raise AngellistApi::Error::Forbidden.new(error_message(env), env[:response_headers])
        when 404
          raise AngellistApi::Error::NotFound.new(error_message(env), env[:response_headers])
        when 406
          raise AngellistApi::Error::NotAcceptable.new(error_message(env), env[:response_headers])
        when 420
          raise AngellistApi::Error::EnhanceYourCalm.new(error_message(env), env[:response_headers])
        end
      end

      private

      def error_message(env)
        "#{env[:method].to_s.upcase} #{env[:url].to_s}: #{env[:status]}#{error_body(env[:body])}"
      end

      def error_body(body)
        if body.nil?
          nil
        elsif body['error']
          ": #{body['error']}"
        elsif body['errors']
          first = Array(body['errors']).first
          if first.kind_of? Hash
            ": #{first['message'].chomp}"
          else
            ": #{first.chomp}"
          end
        end
      end
    end
  end
end
