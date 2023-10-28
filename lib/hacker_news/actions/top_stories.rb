module HackerNews
  module Actions
    class TopStories
      include HackerNews::Action

      # Executes the TopStories endpoint at HackerNews. Returns a list of stories IDs.
      #
      # @return [Array<Integer>] The result of the enpoint.
      def call()
        response = execute(METHOD_GET, "v0/topstories.json", {})
        response.body
      end
    end
  end
end