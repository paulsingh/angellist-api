require 'angel_list/error'

module AngelList
  # Raised when AngelList returns the HTTP status code 420
  class Error::EnhanceYourCalm < AngelList::Error
    # The number of seconds your application should wait before requesting date
    # from the API again
    def retry_after
      @http_headers.values_at('retry-after', 'Retry-After').detect {|value| value }.to_i
    end
  end
end

