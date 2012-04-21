module AngellistApi
  class Client
    # Defines methods related to URLs
    #
    # @see http://angel.co/api/spec/users
    module Users
      # Get a user's information given an id.
      #
      # @requires_authentication No
      # @response_format `json`
      #
      # @param [Integer] id ID of the desired user.
      #
      # @example Get a user's information given an id.
      #   AngellistApi.get_user(1234)
      def get_user(id)
        get("1/users/#{id}", :format => :json)
      end

      # Search for a user given a URL slug. Responds like GET /users/:id.
      #
      # @requires_authentication No
      # @response_format `json`
      #
      # @param [Hash] options A customizable set of options.
      # @option options [String] :slug The URL slug of the desired user.
      # @option options [String] :md5 An md5 hash of the email address of the
      #   desired user.
      #
      # @example Search for a user by URL slug.
      #   AngellistApi.user_search(:slug => '500startups')
      def user_search(options={})
        get("1/users/search", options, :format => :json)
      end

      # Get the current user's information. Responds like GET /users/:id.
      #
      # @requires_authentication Yes
      # @response_format `json`
      #
      # @example Get the authenticated user's information.
      #   AngellistApi.me
      def me
        get("1/me", :format => :json)
      end
    end
  end
end

