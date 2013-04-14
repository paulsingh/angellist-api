module AngellistApi
  # Custom error class for rescuing from all AngellistApi errors
  class Error < StandardError
    attr_reader :http_headers

    # Initializes new Error object
    #
    # @param [String] message
    # @param [Hash] http_headers
    # @return [AngellistApi::Error]
    def initialize(message, http_headers={})
      @http_headers = http_headers
      super message
    end

    # @return [Time]
    def ratelimit_reset
      reset = http_headers['x-ratelimit-reset']
      Time.at(reset.to_i) if reset
    end

    # @return [Integer]
    def ratelimit_limit
      limit = http_headers['x-ratelimit-limit']
      limit.to_i if limit
    end

    # @return [Integer]
    def ratelimit_remaining
      remaining = http_headers['x-ratelimit-remaining']
      remaining.to_i if remaining
    end

    # @return [Integer]
    def retry_after
      [(ratelimit_reset - Time.now).ceil, 0].max if ratelimit_reset
    end
  end
end

