class TopStoriesSyncJob
  include Sidekiq::Job

  sidekiq_options retry: 0

  def perform
    stories = HackerNews::Actions::TopStories.new.call
    stories[0..9].each_with_index { |story_id, index| StorySyncJob.perform_async(story_id, index) }
  end
end
