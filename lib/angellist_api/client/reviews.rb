module AngellistApi
  class Client
    # Defines methods related to URLs
    module Reviews
      # Return reviews for the given user. If no user given, the authenticated user is used. Reviews are paginated and ordered by most recent first. Also returns the total count of positive reviews.
      # @requires_authentication Optional
      # @response_format `json`
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :user_id user_id of the desired user. If none given, defaults to the authenticated user. 
      # @example Return reviews for the given user. If no user given, the authenticated user is used. Reviews are paginated and ordered by most recent first. Also returns the total count of positive reviews.
      #   AngellistApi.get_reviews
      def get_reviews(options={})
        get("1/reviews", options, :format => :json, :phoenix => true)
      end
    end
  end
end
