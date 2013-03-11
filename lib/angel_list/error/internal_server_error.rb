require 'angel_list/error'

module AngelList
  # Raised when AngelList returns the HTTP status code 500
  class Error::InternalServerError < AngelList::Error; end
end

