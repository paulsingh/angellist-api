module AngellistApi
  class Client
    # Defines methods related to URLs
    module StartupRoles      
      # Given a startup_id, returns the users involved in that startup. Given a user_id, returns the startups that user is involved in. If neither parameter is given, the authenticated user is used. Possible roles include team_member, past_investor, advisor and referrer. Roles are paginated and ordered by most recently declared first.
      # @requires_authentication Optional
      # @response_format `json`
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :user_id The user who's startup relationships you want to view. 
      # @option options [Integer] :startup_id  The startup who's user relationships you want to view. 
      # @example Given a startup_id, returns the users involved in that startup. Given a user_id, returns the startups that user is involved in. If neither parameter is given, the authenticated user is used. Possible roles include team_member, past_investor, advisor and referrer. Roles are paginated and ordered by most recently declared first.
      #   AngellistApi.get_startup_roles
      def get_startup_roles(options={})
        get("1/startup_roles", options, :format => :json, :phoenix => true)
      end
    end
  end
end
