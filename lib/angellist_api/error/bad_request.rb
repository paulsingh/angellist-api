require 'angellist_api/error'

module AngellistApi
  # Raised when AngellistApi returns the HTTP status code 400
  class Error::BadRequest < AngellistApi::Error; end
end

