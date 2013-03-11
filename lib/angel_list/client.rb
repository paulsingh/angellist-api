require 'cgi'
require 'angel_list/api'

module AngelList
  # Wrapper for the AngelList REST API
  #
  # @note All methods have been separated into modules and follow the same
  #   grouping used in {http://angel.co/api the AngelList API Documentation}.
  class Client < API
    # Require client method modules after initializing the Client class in
    # order to avoid a superclass mismatch error, allowing those modules to be
    # Client-namespaced.
    require 'angel_list/client/activity_feeds'
    require 'angel_list/client/follows'
    require 'angel_list/client/jobs'
    require 'angel_list/client/messages'
    require 'angel_list/client/paths'
    require 'angel_list/client/press'
    require 'angel_list/client/reviews'
    require 'angel_list/client/search'
    require 'angel_list/client/startups'
    require 'angel_list/client/startup_roles'
    require 'angel_list/client/status_updates'
    require 'angel_list/client/tags'
    require 'angel_list/client/users'

    alias :api_endpoint :endpoint

    include AngelList::Client::ActivityFeeds
    include AngelList::Client::Follows
    include AngelList::Client::Jobs
    include AngelList::Client::Messages
    include AngelList::Client::Paths
    include AngelList::Client::Press
    include AngelList::Client::Reviews
    include AngelList::Client::Search
    include AngelList::Client::Startups
    include AngelList::Client::StartupRoles
    include AngelList::Client::StatusUpdates
    include AngelList::Client::Tags
    include AngelList::Client::Users
  end
end

