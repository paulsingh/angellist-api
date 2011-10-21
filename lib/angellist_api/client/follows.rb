module AngellistApi
  class Client
    # Defines methods related to URLs
    module Follows
      # Makes the authenticated user follow the specified item. Returns the new follow on success, or an error on failure.
      # @requires_authentication Yes
      # @response_format `json`
      # @param options [Hash] A customizable set of options.
      # @option options [String] :type Must be either user or startup. 
      # @option options [Integer] :id The id of the user or startup to start following.
      # @example Makes the authenticated user follow the specified item. Returns the new follow on success, or an error on failure.
      #   AngellistApi.new_follow
      def new_follow(options={})
        post("1/follows", options, :format => :json, :phoenix => true)
      end
      
      # Makes the authenticated user stop following the specified item. Returns the deleted follow on success, or an error on failure.
      # @requires_authentication Yes
      # @response_format `json`
      # @param options [Hash] A customizable set of options.
      # @option options [String] :type Must be either user or startup. 
      # @option options [Integer] :id The id of the user or startup to start following.
      # @example Makes the authenticated user stop following the specified item. Returns the deleted follow on success, or an error on failure.
      #   AngellistApi.delete_follow
      def delete_follow(options={})
        delete("1/follows", options, :format => :json, :phoenix => true)
      end
      
      # Return the given user's followers, paginated and ordered by most recent follower first.
      # @requires_authentication No
      # @response_format `json`
      # @param options [Integer] The id of the given user.
      # @example Return the given user's followers, paginated and ordered by most recent follower first.
      #   AngellistApi.get_user_followers
      def get_user_followers(id)
        get("1/users/#{id}/followers", :format => :json, :phoenix => true)
      end
      
      # Return the ids of the given user's followers, paginated and ordered by most recent follower first.
      # @requires_authentication No
      # @response_format `json`
      # @param options [Integer] The id of the given user.
      # @example Return the ids of the given user's followers, paginated and ordered by most recent follower first.
      #   AngellistApi.get_user_follower_ids
      def get_user_follower_ids(id)
        get("1/users/#{id}/followers/ids", :format => :json, :phoenix => true)
      end
      
      # Return objects that the given user is following, paginated and ordered by most recent follow first. See the type parameter to specify which class of objects to return.
      # @requires_authentication Optional
      # @response_format `json`
      # @param id [Integer] The id of the given user.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :type Must be either user or startup. 
      # @example Return objects that the given user is following, paginated and ordered by most recent follow first. See the type parameter to specify which class of objects to return.
      #   AngellistApi.get_user_following
      def get_user_following(id, options={})
        get("1/users/#{id}/following", options, :format => :json, :phoenix => true)
      end
      
      # Return ids of objects that the given user is following, paginated and ordered by most recent follow first. See the type parameter to specify which class of objects to return. Responds like GET /users/:id/followers/ids.
      # @requires_authentication Optional
      # @response_format `json`
      # @param id [Integer] The id of the given user.
      # @param options [Hash] A customizable set of options.
      # @option options [String] :type Must be either user or startup. 
      # @example Return ids of objects that the given user is following, paginated and ordered by most recent follow first. See the type parameter to specify which class of objects to return. Responds like GET /users/:id/followers/ids.
      #   AngellistApi.get_user_following_ids
      def get_user_following_ids(id, options={})
        get("1/users/#{id}/following/ids", options, :format => :json, :phoenix => true)
      end
      
      # Returns the given startup's followers, paginated and ordered by most recent follower first. Responds like GET /users/:id/followers.
      # @requires_authentication Optional
      # @response_format `json`
      # @param id [Integer] The id of the given user.
      # @param options [Hash] A customizable set of options.
      # @example Returns the given startup's followers, paginated and ordered by most recent follower first. Responds like GET /users/:id/followers.
      #   AngellistApi.get_startup_followers
      def get_startup_followers(id)
        get("1/startups/#{id}/followers", :format => :json, :phoenix => true)
      end
      
      # Returns the ids of the given startup's followers, paginated and ordered by most recent follower first. Responds like GET /users/:id/followers.
      # @requires_authentication Optional
      # @response_format `json`
      # @param id [Integer] The id of the given user.
      # @param options [Hash] A customizable set of options.
      # @example Returns the ids of the given startup's followers, paginated and ordered by most recent follower first. Responds like GET /users/:id/followers.
      #   AngellistApi.get_startup_follower_ids
      def get_startup_follower_ids(id)
        get("1/startups/#{id}/followers/ids", :format => :json, :phoenix => true)
      end
    end
  end
end
