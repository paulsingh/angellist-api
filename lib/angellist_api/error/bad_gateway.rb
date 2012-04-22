require 'angellist_api/error'

module AngellistApi
  # Raised when AngellistApi returns the HTTP status code 502
  class Error::BadGateway < AngellistApi::Error; end
end

