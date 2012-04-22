require 'angellist_api/error'

module AngellistApi
  # Raised when AngellistApi returns the HTTP status code 403
  class Error::Forbidden < AngellistApi::Error; end
end

