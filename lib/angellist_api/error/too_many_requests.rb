require 'angellist_api/error'

module AngellistApi
  # Raised when AngellistApi returns the HTTP status code 403 with "over_limit"
  # in the response.
  #
  # @note We've inquired with the AngelList API team about using a 429 status
  #   in the future.
  class Error
    class TooManyRequests < AngellistApi::Error
      # The number of seconds your application should wait before requesting data
      # from the API again.
      #
      # This may not be supported by AngelList currently but is suggested in RFC
      # 6585 for the 429 status code.
      def retry_after
        @http_headers.values_at('retry-after', 'Retry-After').detect { |value| value }.to_i
      end
    end

    # Backwards compatability
    EnhanceYourCalm = TooManyRequests
  end
end

