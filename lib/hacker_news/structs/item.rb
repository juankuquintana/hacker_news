module HackerNews
  module Structs
    # Representation of a HackerNews item.
    class Item
      include Structs::Model

      # The item's unique id.
      attr_accessor :id
      #	true if the item is deleted.
      attr_accessor :deleted
      #	The type of item. One of "job", "story", "comment", "poll", or "pollopt".
      attr_accessor :type
      #	The username of the item's author.
      attr_accessor :by
      #	Creation date of the item, in Unix Time.
      attr_accessor :time
      #	The comment, story or poll text. HTML.
      attr_accessor :text
      #	true if the item is dead.
      attr_accessor :dead
      #	The comment's parent: either another comment or the relevant story.
      attr_accessor :parent
      #	The pollopt's associated poll.
      attr_accessor :poll
      #	The ids of the item's comments, in ranked display order.
      attr_accessor :kids
      #	The URL of the story.
      attr_accessor :url
      #	The story's score, or the votes for a pollopt.
      attr_accessor :score
      #	The title of the story, poll or job. HTML.
      attr_accessor :title
      #	A list of related pollopts, in display order.
      attr_accessor :parts
      #	In the case of stories or polls, the total comment count.
      attr_accessor :descendants
    end
  end
end
