class StoriesRepository
  def top_stories(limit = 10)
    Story.select('DISTINCT ON (rank) *').order(rank: :asc, updated_at: :desc).limit(limit)
  end

  def story_active_comments(story_id)
    Comment.where(story_id:).where("deleted IS NOT true")
  end
end
