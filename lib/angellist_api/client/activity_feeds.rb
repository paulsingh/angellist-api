module AngellistApi
  class Client
    # Defines methods related to URLs
    module ActivityFeeds
      
      # Returns site activity. If authenticated and the personalized parameter is passed in, only activity from the authenticated user's social graph is returned. No more than 25 items will be returned. Results are paginated and ordered by most recent story first.
      # @requires_authentication Optional
      # @response_format `json`
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :personalized If set to 1 and a user is authenticated, only activity from the authenticated user's social graph is returned.
      # @example 
      #   AngellistApi.get_feed
      def get_feed(options={})
        get("1/feed", options, :format => :json, :phoenix => true)
      end
      
    end
  end
end