require 'angel_list/error'

module AngelList
  # Raised when AngelList returns the HTTP status code 404
  class Error::NotFound < AngelList::Error; end
end

