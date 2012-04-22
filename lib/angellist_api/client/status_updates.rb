module AngellistApi
  class Client
    # Defines methods related to URLs
    #
    # @see http://angel.co/api/spec/status_updates
    module StatusUpdates
      # Return status updates from the given user or startup. If neither is
      # specified, the authenticated user is used. Status updates are paginated
      # and ordered by most recent first.
      #
      # @requires_authentication Optional
      #
      # @param [Hash] options A customizable set of options.
      # @option options [Integer] :user_id id of the desired user.
      # @option options [Integer] :startup_id id of the desired startup.
      #
      # @example Get status updates for the authenticated user.
      #   AngellistApi.get_status_updates
      #
      # @example Get status updates for the startup with ID 1234.
      #   AngellistApi.get_status_updates(:startup_id => 1234)
      def get_status_updates(options={})
        get("1/status_updates", options)
      end

      # Creates a status update for the authenticated user or for a startup the
      # authenticated user is a team member of. Returns the new status update
      # on success, or an error on failure.
      #
      # @requires_authentication Yes
      #
      # @param [Hash] options A customizable set of options.
      # @option options [String] :message The new status. Must be between 1 and
      #   140 characters.
      # @option options [Integer] :startup_id id of the startup whose status
      #   you want to update. If unspecified, the authenticated user's status
      #   is updated.
      #
      # @example Update the authenticated user's status.
      #   AngellistApi.post_status_updates(:message => "Startup advice: Don't fuck up.")
      def post_status_updates(options={})
        post("1/status_updates", options)
      end

      # Destroys the specified status update belonging to the authenticated
      # user or to a startup the authenticated user is a team member of.
      # Returns the destroyed status update on success, or an error on failure.
      #
      # @requires_authentication Yes
      #
      # @param [Integer] id ID of the desired status message.
      #
      # @example Destroys specified status update belonging to authenticated user.
      #   AngellistApi.delete_status_updates(1234)
      def delete_status_updates(id)
        delete("1/status_updates/#{id}")
      end
    end
  end
end

