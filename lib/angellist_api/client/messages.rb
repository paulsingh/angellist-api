module AngellistApi
  class Client
    # Defines methods related to URLs
    #
    # @see http://angel.co/api/spec/messages
    module Messages
      
      # Returns threads that the authenticated user is involved in. A "thread"
      # is a conversation between two users, where each message is tagged with
      # the same thread_id. If the authenticated user has any unread messages 
      #in the thread, the viewed attribute will be false. Requires scope "message".
      #
      # @requires_authentication Yes
      # @paginated Yes
      #
      # @param options [Hash] A customizable set of options.
      # @option options [String] :view One of inbox, unread or sent. Defaults to inbox. 
      #   The inbox view returns all threads in which the user has received at least 
      #   one message. The unread view is a subset of the inbox view which only includes
      #   threads with an unread message. The sent view returns all threads in which the 
      #   user has sent at least one message.
      # @option options [Integer] :thread_id Returns the messages for the given thread
      #   that the authenticated user is involved in. The viewed attribute will be present
      #   for messages that were sent to the authenticated user. Messages are paginated 
      #   and ordered by message timestamp descending. Requires scope "message".
      def get_messages(options={})
        get("1/messages", options)
      end
      
      # Creates a new message from the authenticated user to the other participant of the 
      # given thread. Returns the new message on success. Requires scope "message".
      #
      # @requires_authentication Yes
      #
      # @param options [Hash] A customizable set of options.
      # @option options [Integer] :recipient_id The id of the user receiving the message
      # @option options [Integer] :thread_id The id of the thread that you want the message 
      #   to be attached to. 
      # @option options [String] :body The body of the message.
      def post_messages(options={})
        post("1/messages", options)
      end
    end
  end
end
