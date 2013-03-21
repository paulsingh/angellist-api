module AngellistApi
  class Client
    # Defines methods related to URLs
    #
    # @see http://angel.co/api/spec/startup_roles
    module StartupRoles
      # Given a user_id, returns the companies that User is tagged in. Given a startup_id, 
      # returns either the users and companies tagged in the given Startup (if direction is  
      # incoming) or the companies which the given Startup is tagged in (if direction is 
      # outgoing). If neither parameter is given, the authenticated user is used. Possible 
      # roles include founder, employee, past_investor, current_investor, advisor, incubator 
      # and referrer. Roles are paginated and ordered by most recently declared first.
      #
      # @requires_authentication Optional
      # @paginated Yes
      #
      # @param [Hash] options A customizable set of options.
      # @option options [Integer] :user_id The user whose startup relationships
      #   you want to view.
      # @option options [Integer] :startup_id  The startup whose user
      #   relationships you want to view.
      # @option options [String] :direction  Only applies if startup_id is present. 
      #   Either incoming or outgoing. Defaults to incoming.
      # @option options [Integer] :page Specifies the page of results to
      #   retrieve.
      #
      # @example Get info about authenticated user's startups and roles.
      #   AngellistApi.get_startup_roles
      #
      # @example Get users involved in startup with ID 1234, and their roles.
      #   AngellistApi.get_startup_roles(:startup_id => 1234)
      def get_startup_roles(options={})
        options.merge!(:v => 1)
        get("1/startup_roles", options)
      end
    end
  end
end

