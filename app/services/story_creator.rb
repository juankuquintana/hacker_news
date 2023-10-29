class StoryCreator
  def initialize
  end

  def call(story_struct, rank)
    story = Story.find_or_create_by(reference_id: story_struct.id)
    story.reference_id = story_struct.id
    story.title = story_struct.title
    story.url = story_struct.url
    story.time = story_struct.time
    story.author = story_struct.by
    story.deleted = story_struct.deleted
    story.metadata = story_struct.to_json
    story.rank = rank
    story.save!

    story_struct.kids.each do |comment_id|
      item = HackerNews::Actions::Item.new.call(comment_id)
      comment = Comment.find_or_create_by(reference_id: comment_id, story_id: story.id)
      comment.reference_id = item.id
      comment.content = item.text
      comment.time = item.time
      comment.author = item.by
      comment.deleted = item.deleted
      comment.metadata = item.to_json
      comment.save!
    end
    story.save!
  end
end