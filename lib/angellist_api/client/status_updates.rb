module AngellistApi
  class Client
    # Defines methods related to URLs
    module StatusUpdates      
      # Return status updates from the given user or startup. If neither is specified, the authenticated user is used. Status updates are paginated and ordered by most recent first.
      # @requires_authentication Optional
      # @response_format `json`
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :user_id id of the desired user. 
      # @option options [Integer] :startup_id id of the desired startup. 
      # @example Return status updates from the given user or startup. If neither is specified, the authenticated user is used. Status updates are paginated and ordered by most recent first.
      #   AngellistApi.get_status_updates
      def get_status_updates(options={})
        get("1/status_updates", options, :format => :json, :phoenix => true)
      end
      
      # Creates a status update for the authenticated user or for a startup the authenticated user is a team member of. Returns the new status update on success, or an error on failure.
      # @requires_authentication Yes
      # @response_format `json`
      # @param options [Hash] A customizable set of options.
      # @option options [String] :message The new status. Must be between 1 and 140 characters. 
      # @option options [Integer] :startup_id id of the startup whose status you want to update. If unspecified, the authenticated user's status is updated. 
      # @example Creates a status update for the authenticated user or for a startup the authenticated user is a team member of. Returns the new status update on success, or an error on failure.
      #   AngellistApi.post_status_updates
      def post_status_updates(options={})
        post("1/status_updates", options, :format => :json, :phoenix => true)
      end
      
      # Destroys the specified status update belonging to the authenticated user or to a startup the authenticated user is a team member of. Returns the destroyed status update on success, or an error on failure.
      # @requires_authentication Yes
      # @response_format `json`
      # @param id [Integer] id of the desired status message. 
      # @example Destroys the specified status update belonging to the authenticated user or to a startup the authenticated user is a team member of. Returns the destroyed status update on success, or an error on failure.
      #   AngellistApi.delete_status_updates
      def delete_status_updates(id)
        delete("1/status_updates/#{id}", :format => :json, :phoenix => true)
      end
    end
  end
end
