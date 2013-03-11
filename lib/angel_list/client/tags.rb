module AngelList
  class Client
    # Defines methods related to URLs.
    #
    # @see http://angel.co/api/spec/tags
    module Tags
      # Get information on a tag.
      #
      # @requires_authentication No
      #
      # @param [Integer] id ID of the desired tag.
      #
      # @example Get information on a tag.
      #   AngelList.get_tag(1654)
      def get_tag(id)
        get("1/tags/#{id}")
      end

      # Returns children of the given tag. Market and location tags form a
      # Directed Acyclic Graph. Results are paginated and ordered by id
      # descending.
      #
      # @requires_authentication No
      #
      # @param [Integer] id The id of the desired tag. Currently only works for
      #   tags of type MarketTag or LocationTag.
      #
      # @example Get children of a tag.
      #   AngelList.get_tag_children(1654)
      def get_tag_children(id)
        get("1/tags/#{id}/children")
      end

      # Returns parents of the given tag. For more details, see the
      # documentation for GET /tags/:id/children.
      #
      # @requires_authentication No
      #
      # @param [Integer] id The id of the desired tag. Currently only works for
      #   tags of type MarketTag or LocationTag.
      #
      # @example Get parents of a tag.
      #   AngelList.get_tag_parents(1654)
      def get_tag_parents(id)
        get("1/tags/#{id}/parents")
      end

      # Returns startups that are tagged with the given tag or a child of the
      # given tag. Results are paginated and ordered according to the order
      # parameter.
      #
      # @requires_authentication Optional
      #
      # @param [Hash] options A customizable set of options.
      # @option options [String] :order May be one of popularity, asc or desc.
      #   Startups will be ordered by number of followers, ascending id or
      #   descending id, respectively. Defaults to desc
      #
      # @example Get startups tagged with tag ID or its children.
      #   AngelList.get_tag_startups(1654)
      #
      # @see http://angel.co/api/spec/startups
      def get_tag_startups(id, options = {})
        get("1/tags/#{id}/startups", options)
      end
    end
  end
end

