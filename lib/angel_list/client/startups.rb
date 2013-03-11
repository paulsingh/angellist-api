module AngelList
  class Client
    # Defines methods related to URLs
    #
    # @see http://angel.co/api/spec/startups
    module Startups
      # Get a startup's information given an ID.
      #
      # @requires_authentication Optional
      #
      # @param [Integer] id ID of the desired startup.
      #
      # @example Get a startup's information given an ID.
      #   AngelList.get_startup(1234)
      def get_startup(id)
        get("1/startups/#{id}")
      end

      # Returns the comments on the given startup.
      #
      # @requires_authentication Optional
      # @paginated No
      #
      # @param id [Integer] ID of the desired startup.
      #
      # @example Get comments left about a startup with ID 1234.
      #   AngelList.startup_comments(1234)
      def startup_comments(id)
        get("1/startups/#{id}/comments")
      end

      # Returns up to 50 startups at a time, given an Array of ids.
      #
      # @requires_authentication Optional
      #
      # @param ids [Array] IDs of the startups to fetch.
      #
      # @example Get information for a batch of startups.
      #   AngelList.get_startups([1, 2, 3])
      def get_startups(ids)
        params = { :ids => ids.join(',') }
        get("1/startups/batch", params)
      end

      # Search for a startup given a URL slug. Responds like GET /startups/:id.
      #
      # @requires_authentication Optional
      #
      # @param [Hash] options A customizable set of options.
      # @option options [String] :slug The URL slug of the desired startup.
      # @option options [String] :domain The domain of the desired startup.
      #   Subdomains are not allowed. Keep in mind that startups can list any
      #   domain as their own. The startup with the most followers will be
      #   returned in the case of multiple hits.
      #
      # @example Search for a startup given a URL slug. Responds like GET /startups/:id.
      #   AngelList.startup_search(:slug => '500-startups-fund')
      def startup_search(options={})
        get("1/startups/search", options)
      end
    end
  end
end

