require 'angellist_api/error'

module AngellistApi
  # Raised when AngellistApi returns the HTTP status code 503
  class Error::ServiceUnavailable < AngellistApi::Error; end
end

