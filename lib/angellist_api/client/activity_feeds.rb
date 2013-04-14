module AngellistApi
  class Client
    # Defines methods related to URLs
    #
    # @see http://angel.co/api/spec/activity_feeds
    module ActivityFeeds

      # Returns site activity. If authenticated and the personalized parameter
      # is passed in, only activity from the authenticated user's social graph
      # is returned. No more than 25 items will be returned. Results are
      # paginated and ordered by most recent story first.
      #
      # @requires_authentication Optional
      # @paginated By explicit timestamp cursor
      #
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :personalized If set to 1 and a user is
      #   authenticated, only activity from the authenticated user's social graph
      #   is returned.
      # @option options [Integer] :since If a Unix timestamp is passed in via
      #   this parameter, only activity since that timestamp will be returned. A
      #   maximum of 25 items will be returned, starting with the oldest item. A
      #   cursor variable is also returned, which is the timestamp of the last
      #   item. You may call /feed again with since set to this value to get the
      #   next page of activity.
      #
      # @example
      #   AngellistApi.get_feed
      def get_feed(options={})
        get("1/feed", options)
      end

      # Returns a specific activity feed item.
      #
      # @requires_authentication No
      #
      # @param id [String] String ID of the feed item to retrieve.
      #
      # @example Get a feed item.
      #   AngellistApi.feed_item('8fCC3')
      def feed_item(id)
        get("1/feed/#{id}")
      end
    end
  end
end

