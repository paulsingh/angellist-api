module AngellistApi
  class Client
    # Defines methods related to URLs
    #
    # @see http://angel.co/api/spec/users
    module Users
      # Get a user's information given an id.
      #
      # @requires_authentication No
      #
      # @param [Integer] id ID of the desired user.
      #
      # @example Get a user's information given an id.
      #   AngellistApi.get_user(1234, :include_details => 'investor')
      def get_user(id, options={})
        get("1/users/#{id}", options)
      end

      # Get information for a batch of up to 50 users given a list of user IDs.
      #
      # @requires_authentication No
      # @pagination No
      #
      # @param [Array] ids IDs of the users to fetch.
      #
      # @example Get information for a batch of users.
      #   AngellistApi.get_users([1, 2, 3])
      def get_users(ids)
        params = { :ids => ids.join(',') }
        get("1/users/batch", params)
      end

      # Search for a user given a URL slug. Responds like GET /users/:id.
      #
      # @requires_authentication No
      # @pagination No
      #
      # @param [Hash] options A customizable set of options.
      # @option options [String] :slug The URL slug of the desired user.
      # @option options [String] :md5 An md5 hash of the email address of the
      #   desired user.
      #
      # @example Search for a user by URL slug.
      #   AngellistApi.user_search(:slug => '500startups')
      def user_search(options={})
        get("1/users/search", options)
      end

      # Get the current user's information. Responds like GET /users/:id.
      #
      # @requires_authentication Yes
      #
      # @example Get the authenticated user's information.
      #   AngellistApi.me
      def me
        get("1/me")
      end

      # Returns the companies that a user has been tagged in. Results are paginated.
      #
      # @requires_authentication Optional
      # @paginated Yes
      #
      # @param [Integer] id ID of the desired user.
      # @option options [Integer] :page Specifies the page of results to
      #   retrieve.
      #
      # @example Get a user's roles given an id.
      #   AngellistApi.user_roles(1234)
      def user_roles(id, options={})
        get("1/users/#{id}/roles", options)
      end

      # Returns users that are tagged with the given tag, either a LocationTag
      # or MarketTag. Results are paginated and ordered from highest quality to
      # lowest quality.
      #
      # @requires_authentication No
      # @paginated Yes
      #
      # @param [Integer] id ID of the desired tag either a LocationTag or MarketTag.
      # @option options [Integer] :include_children Set to 1 if you'd like the results
      #   to also include child tags. For example, if you pass in California but want
      #   to also see users tagged with San Francisco and Los Angeles.
      #   Cannot be combined with include_parents..
      # @option options [Integer] :include_parents Set to 1 if you'd like the results
      #   to also include parent tags. For example, if you pass in San Francisco,
      #   but also want to see investors who follow Silicon Valley, California and
      #   the US. Cannot be combined with include_children.
      # @option options [String] :investors May be either by_residence or by_activity.
      #   Narrows the results to only return investors. by_residence will only return
      #   investors who reside in the given tag. by_activity will only return investors
      #   who invest in the given tag.
      #
      # @example Get users tagged with tag ID, and all children of that tag.
      #   AngellistApi.user_tags(1654, :include_children => 1)
      def get_tag_users(id, options={})
        get("1/tags/#{id}/users", options)
      end
    end
  end
end

