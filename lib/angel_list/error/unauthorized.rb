require 'angel_list/error'

module AngelList
  # Raised when AngelList returns the HTTP status code 401
  class Error::Unauthorized < AngelList::Error; end
end

