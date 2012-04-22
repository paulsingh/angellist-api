require 'angellist_api/error'

module AngellistApi
  # Raised when AngellistApi returns the HTTP status code 406
  class Error::NotAcceptable < AngellistApi::Error; end
end

