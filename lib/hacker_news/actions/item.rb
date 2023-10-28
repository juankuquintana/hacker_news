module HackerNews
  module Actions
    class Item
      include HackerNews::Action

      # Executes the item endpoint at HackerNews. Returns an item.
      #
      # @return [HackerNews::Struct::Item] The result of the enpoint.
      def call(id)
        response = execute(METHOD_GET, "v0/item/#{id}.json", {})

        HackerNews::Structs::Item.new(
            id: response.body["id"],
            deleted: response.body["deleted"],
            type: response.body["type"],
            by: response.body["by"],
            time: response.body["time"],
            text: response.body["text"],
            dead: response.body["dead"],
            parent: response.body["parent"],
            poll: response.body["poll"],
            kids: response.body["kids"],
            url: response.body["url"],
            score: response.body["score"],
            title: response.body["title"],
            parts: response.body["parts"],
            descendants: response.body["descendants"],
          )
      end
    end
  end
end
