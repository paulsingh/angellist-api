require 'faraday'
require 'angel_list/error/bad_request'
require 'angel_list/error/enhance_your_calm'
require 'angel_list/error/forbidden'
require 'angel_list/error/not_acceptable'
require 'angel_list/error/not_found'
require 'angel_list/error/unauthorized'

module AngelList
  module Response
    class RaiseClientError < Faraday::Response::Middleware
      def on_complete(env)
        case env[:status].to_i
        when 400
          raise AngelList::Error::BadRequest.new(error_message(env), env[:response_headers])
        when 401
          raise AngelList::Error::Unauthorized.new(error_message(env), env[:response_headers])
        when 403
          raise AngelList::Error::Forbidden.new(error_message(env), env[:response_headers])
        when 404
          raise AngelList::Error::NotFound.new(error_message(env), env[:response_headers])
        when 406
          raise AngelList::Error::NotAcceptable.new(error_message(env), env[:response_headers])
        when 420
          raise AngelList::Error::EnhanceYourCalm.new(error_message(env), env[:response_headers])
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

