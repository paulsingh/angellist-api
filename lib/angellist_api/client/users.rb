module AngellistApi
  class Client
    # Defines methods related to URLs
    module Users
      # Get a user's information given an id.
      # @requires_authentication No
      # @response_format `json`
      # @param id [Integer] :id id of the desired user.
      # @example Get a user's information given an id.
      #   AngellistApi.get_user
      def get_user(id)
        get("1/users/#{id}", :format => :json, :phoenix => true)
      end
      
      # Search for a user given a URL slug. Responds like GET /users/:id.
      # @requires_authentication No
      # @response_format `json`
      # @param options [Hash] A customizable set of options.
      # @option options [String] :slug The URL slug of the desired user. 
      # @option options [String] :md5 An md5 hash of the email address of the desired user. 
      # @example Search for a user given a URL slug or md5 hash of an email address. Responds like GET /users/:id.
      #   AngellistApi.user_search
      def user_search(options={})
        get("1/users/search", options, :format => :json, :phoenix => true)
      end
      
      # Get the current user's information. Responds like GET /users/:id.
      # @requires_authentication Yes
      # @response_format `json`
      # @example Get the current user's information. Responds like GET /users/:id.
      #   AngellistApi.user_search
      def me
        get("1/me", :format => :json, :phoenix => true)
      end
    end
  end
end
