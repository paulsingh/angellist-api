module AngellistApi
  class Client
    # Defines methods related to URLs
    module Tags      
      # Get information on a tag
      # @requires_authentication No
      # @response_format `json`
      # @param id [Integer] id of the desired tag. 
      # @example Get information on a tag
      #   AngellistApi.get_tag
      def get_tag(id)
        get("1/tags/#{id}", :format => :json, :phoenix => true)
      end
      
      # Returns children of the given tag. Market and location tags form a Directed Acyclic Graph. Results are paginated and ordered by id descending.
      # @requires_authentication No
      # @response_format `json`
      # @param id [Integer] The id of the desired tag. Currently only works for tags of type MarketTag or LocationTag. 
      # @example Returns children of the given tag. Market and location tags form a Directed Acyclic Graph. Results are paginated and ordered by id descending.
      #   AngellistApi.get_tag_children
      def get_tag_children(id)
        get("1/tags/#{id}/children", :format => :json, :phoenix => true)
      end
      
      # Returns parents of the given tag. For more details, see the documentation for GET /tags/:id/children.
      # @requires_authentication No
      # @response_format `json`
      # @param id [Integer] The id of the desired tag. Currently only works for tags of type MarketTag or LocationTag. 
      # @example Returns parents of the given tag. For more details, see the documentation for GET /tags/:id/children.
      #   AngellistApi.get_tag_parents
      def get_tag_parents(id)
        get("1/tags/#{id}/parents", :format => :json, :phoenix => true)
      end
      
      # Returns startups that are tagged with the given tag or a child of the given tag. Results are paginated and ordered according to the order parameter.
      # @requires_authentication Optional
      # @response_format `json`
      # @param options [Hash] A customizable set of options.
      # @option options [String] :order May be one of popularity, asc or desc. Startups will be ordered by number of followers, ascending id or descending id, respectively. Defaults to desc
      # @example Returns Returns startups that are tagged with the given tag or a child of the given tag. Results are paginated and ordered according to the order parameter.
      #   AngellistApi.get_tag_startups
      def get_tag_startups(id, options = {})
        get("1/tags/#{id}/startups", options, :format => :json, :phoenix => true)
      end
    end
  end
end
