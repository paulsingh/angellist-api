module AngellistApi
  class Client
    # Defines methods related to path resources (social connections)
    #
    # @see http://angel.co/api/spec/paths
    module Paths
      # Show paths between you and given user/startup ids.
      #
      # Additional notes:
      #
      # - for each user/startup up to 10 different paths will show up
      # - up to 20 ids per request are allowed
      # - do not use user_ids and startup_ids at the same time
      #
      # @requires_authentication Yes
      #
      # @param options [Hash] A customizable set of options.
      # @option options [Array<Integer>] :user_ids Show paths between you and
      #   these users
      # @option options [Array<Integer>] :startup_ids Show paths between you
      #   and these startups
      # @option options [string] :direction "following" or "followed"
      #
      # @todo This is a great case for a 2.0 version of our lib that has some
      #   real OOP abstraction -- the results of this as a dumb hash are pretty
      #   disgusting to work with.
      def get_paths(options={})
        user_ids = options.delete(:user_ids) { [] }
        startup_ids = options.delete(:startup_ids) { [] }

        options.merge!(:user_ids => user_ids.join(',')) if user_ids.any?
        options.merge!(:startup_ids => startup_ids.join(',')) if startup_ids.any?

        get('1/paths', options)
      end
    end
  end
end

