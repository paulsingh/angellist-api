require 'angellist_api/error'

module AngellistApi
  # Raised when AngellistApi returns the HTTP status code 401
  class Error::Unauthorized < AngellistApi::Error; end
end

