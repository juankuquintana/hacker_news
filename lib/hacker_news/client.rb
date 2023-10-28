require 'faraday_logger'

module HackerNews
  class Client
    class << self
      attr_accessor :default_client
    end

    DEFAULT_TIMEOUT = 20

    # @return [String]
    attr_accessor :base_url
    # @return [Integer]
    attr_accessor :timeout
    # @return [Faraday::Connection] the current HTTP client
    attr_reader :http_client

    def initialize(base_url:, timeout: DEFAULT_TIMEOUT)
      self.base_url = base_url
      self.timeout = timeout
      @http_client = initialize_http_client
    end

    # Executes the request, and returns the Response.
    #
    # @param  params [Hash]
    # @return [Faraday::Response]
    def request(method, url, params = {})
      http_client.send(method, url, params:)
    rescue Faraday::ConnectionFailed
      raise ConnectionError.new, "HackerNews connection failed"
    rescue Faraday::TimeoutError
      raise ConnectionError.new, "HackerNews connection timeout"
    rescue Faraday::SSLError => exception
      raise SSLError.new, exception.message
    end

    private

    def initialize_http_client
      Faraday.new(base_url) do |faraday|
        faraday.use FaradayLogger
        faraday.adapter Faraday.default_adapter
        faraday.request :json
        faraday.options[:timeout] = timeout
        faraday.headers["Accept"] = "application/json"
        faraday.headers["Content-Type"] = "application/json"
        faraday.response :json, content_type: /\bjson$/
      end
    end
  end
end