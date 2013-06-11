module AngellistApi
  class Client
    # Defines methods related to URLs
    #
    # @see http://angel.co/api/spec/reviews
    module Reviews
      # Return reviews for the given user. If no user given, the authenticated
      # user is used. Reviews are paginated and ordered by most recent first.
      # Also returns the total count of positive reviews.
      #
      # @requires_authentication Optional
      # @paginated Yes
      #
      # @param [Hash] options A customizable set of options.
      # @option options [Integer] :user_id user_id of the desired user. If none
      #   given, defaults to the authenticated user.
      #
      # @example Get reviews for the authenticated user.
      #   AngellistApi.get_reviews
      #
      # @example Get reviews for a given user ID.
      #   AngellistApi.get_reviews(:user_id => 1234)
      def get_reviews(options={})
        get("1/reviews", options)
      end

      # Shows details for a specific review
      #
      # @requires_authentication No
      #
      # @param id [Integer] ID of the review to fetch.
      #
      # @example Get information for a review.
      #   AngellistApi.get_review(1098)
      def get_review(id)
        get("1/reviews/#{id}")
      end
    end
  end
end

