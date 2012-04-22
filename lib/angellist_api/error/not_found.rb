require 'angellist_api/error'

module AngellistApi
  # Raised when AngellistApi returns the HTTP status code 404
  class Error::NotFound < AngellistApi::Error; end
end

