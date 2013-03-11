require 'angel_list/error'

module AngelList
  # Raised when AngelList returns the HTTP status code 502
  class Error::BadGateway < AngelList::Error; end
end

