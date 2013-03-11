require 'angel_list/error'

module AngelList
  # Raised when AngelList returns the HTTP status code 403
  class Error::Forbidden < AngelList::Error; end
end

