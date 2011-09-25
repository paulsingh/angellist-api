module AngellistApi
  class Client
    # Defines methods related to URLs
    module Startups
      # Get a startup's information given an id.
      # @requires_authentication Optional
      # @response_format `json`
      # @param id [Integer] :id id of the desired startup.
      # @example Get a startup's information given an id.
      #   AngellistApi.get_startup
      def get_startup(id)
        get("1/startups/#{id}", :format => :json, :phoenix => true)
      end
      
      # Search for a startup given a URL slug. Responds like GET /startups/:id.
      # @requires_authentication Optional
      # @response_format `json`
      # @param options [Hash] A customizable set of options.
      # @option options [String] :slug The URL slug of the desired startup. 
      # @option options [String] :domain The domain of the desired startup. Subdomains are not allowed. Keep in mind that startups can list any domain as their own. The startup with the most followers will be returned in the case of multiple hits. 
      # @example Search for a startup given a URL slug. Responds like GET /startups/:id.
      #   AngellistApi.startup_search
      def startup_search(options={})
        get("1/startups/search", options, :format => :json, :phoenix => true)
      end
    end
  end
end
