class StorySyncJob
  include Sidekiq::Job

  sidekiq_options retry: 0

  def perform(id)
    story = HackerNews::Actions::Item.new.call(id)
    StoryCreator.new.call(story)
  end
end
