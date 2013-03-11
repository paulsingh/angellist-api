require 'angel_list/error'

module AngelList
  # Raised when AngelList returns the HTTP status code 400
  class Error::BadRequest < AngelList::Error; end
end

