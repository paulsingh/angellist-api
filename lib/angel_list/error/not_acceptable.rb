require 'angel_list/error'

module AngelList
  # Raised when AngelList returns the HTTP status code 406
  class Error::NotAcceptable < AngelList::Error; end
end

