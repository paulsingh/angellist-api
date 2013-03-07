require 'cgi'
require 'angellist_api/api'

module AngellistApi
  # Wrapper for the AngellistApi REST API
  #
  # @note All methods have been separated into modules and follow the same
  #   grouping used in {http://angel.co/api the Angellist API Documentation}.
  class Client < API
    # Require client method modules after initializing the Client class in
    # order to avoid a superclass mismatch error, allowing those modules to be
    # Client-namespaced.
    require 'angellist_api/client/activity_feeds'
    require 'angellist_api/client/follows'
    require 'angellist_api/client/jobs'
    require 'angellist_api/client/messages'
    require 'angellist_api/client/paths'
    require 'angellist_api/client/press'
    require 'angellist_api/client/reviews'
    require 'angellist_api/client/search'
    require 'angellist_api/client/startups'
    require 'angellist_api/client/startup_roles'
    require 'angellist_api/client/status_updates'
    require 'angellist_api/client/tags'
    require 'angellist_api/client/users'

    alias :api_endpoint :endpoint

    include AngellistApi::Client::ActivityFeeds
    include AngellistApi::Client::Follows
    include AngellistApi::Client::Jobs
    include AngellistApi::Client::Messages
    include AngellistApi::Client::Paths
    include AngellistApi::Client::Press
    include AngellistApi::Client::Reviews
    include AngellistApi::Client::Search
    include AngellistApi::Client::Startups
    include AngellistApi::Client::StartupRoles
    include AngellistApi::Client::StatusUpdates
    include AngellistApi::Client::Tags
    include AngellistApi::Client::Users
  end
end

