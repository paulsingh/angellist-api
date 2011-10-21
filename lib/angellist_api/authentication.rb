module AngellistApi
  # @private
  module Authentication
    private

    # Authentication hash
    #
    # @return [Hash]
    def authentication
      {
        :consumer_key     => respond_to?(:consumer_key) ? consumer_key : nil,
        :consumer_secret  => respond_to?(:consumer_secret) ? consumer_secret : nil,
        :token            => respond_to?(:oauth_token) ? oauth_token : nil,
        :token_secret     => respond_to?(:oauth_token_secret) ? oauth_token_secret : nil,
      }
    end

    # Check whether user is authenticated
    #
    # @return [Boolean]
    def authenticated?
      authentication.values.all?
    end
  end
end
