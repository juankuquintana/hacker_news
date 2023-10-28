require_relative 'client'

module HackerNews
  module Action
    METHOD_GET = :get

    attr_accessor :client

    def initialize(client: HackerNews::Client.default_client)
      @client = client
    end

    def execute(method, path, params)
      client.request(method, path, params:)
    end
  end
end
