class StorySyncJob
  include Sidekiq::Job

  sidekiq_options retry: 0

  def perform(id, rank)
    story = HackerNews::Actions::Item.new.call(id)
    StoryCreator.new.call(story, rank)
  end
end
