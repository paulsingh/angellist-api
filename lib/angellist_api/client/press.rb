module AngellistApi
  class Client
    # Defines methods related to URLs
    #
    # @see http://angel.co/api/spec/press
    module Press
      
      # Return press for the given startup. Press is paginated and ordered by
      # most recent first, according to the post date.
      #
      # @requires_authentication No
      # @paginated Yes
      #
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :startup_id Specifies the desired startup
      # @option options [Integer] :page Specifies the page of results to
      #   retrieve.
      # @option options [Integer] :per_page (50) The number of results to return
      #   for a page. Maximum of 50.
      def get_press(options={})
        get("1/press", options)
      end
    end
  end
end
