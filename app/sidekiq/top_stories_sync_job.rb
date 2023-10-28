class TopStoriesSyncJob
  include Sidekiq::Job

  sidekiq_options retry: 0

  def perform
    stories = HackerNews::Actions::TopStories.new.call
    stories[0..9].each { |story_id| StorySyncJob.perform_async(story_id) }
  end
end
