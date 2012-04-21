module AngellistApi
  class Client
    # Defines methods related to URLs
    #
    # @see http://angel.co/api/spec/startup_roles
    module StartupRoles
      # Given a startup_id, returns the users involved in that startup. Given a
      # user_id, returns the startups that user is involved in. If neither
      # parameter is given, the authenticated user is used. Possible roles
      # include founder, employee, past_investor, advisor, incubator and
      # referrer. Roles are paginated and ordered by most recently declared
      # first.
      #
      # @requires_authentication Optional
      # @response_format `json`
      #
      # @param [Hash] options A customizable set of options.
      # @option options [Integer] :user_id The user whose startup relationships
      #   you want to view.
      # @option options [Integer] :startup_id  The startup whose user
      #   relationships you want to view.
      #
      # @example Get info about authenticated user's startups and roles.
      #   AngellistApi.get_startup_roles
      #
      # @example Get users involved in startup with ID 1234, and their roles.
      #   AngellistApi.get_startup_roles(:startup_id => 1234)
      def get_startup_roles(options={})
        get("1/startup_roles", options, :format => :json)
      end
    end
  end
end

