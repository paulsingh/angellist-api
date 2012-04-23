module AngellistApi
  class Client
    # Defines methods related to URLs
    #
    # @see http://angel.co/api/spec/search
    module Search
      # Search for Startups, Users, MarketTags and LocationTags, optionally
      # narrowing the results by type. Results are sorted by a mix of match and
      # popularity.
      #
      # @requires_authentication No
      # @paginated No
      #
      # @param query [String] The search query. Will be URI-escaped.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :type A scope for the query. Can be one of
      #   'User', 'Startup', 'MarketTag' or 'LocationTag'.
      #
      # @example Search all data types.
      #   AngellistApi.search('machine learning')
      #
      # @example Search locations.
      #   AngellistApi.search('springfield', :type => 'LocationTag')
      def search(query, options={})
        options.merge!(:query => CGI.escape(query))
        get("1/search", options)
      end
    end
  end
end

