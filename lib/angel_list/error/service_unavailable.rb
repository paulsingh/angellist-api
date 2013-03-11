require 'angel_list/error'

module AngelList
  # Raised when AngelList returns the HTTP status code 503
  class Error::ServiceUnavailable < AngelList::Error; end
end

