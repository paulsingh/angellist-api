require 'angellist_api/error'

module AngellistApi
  # Raised when AngellistApi returns the HTTP status code 500
  class Error::InternalServerError < AngellistApi::Error; end
end

