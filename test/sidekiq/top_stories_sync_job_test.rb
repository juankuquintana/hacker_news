require 'test_helper'

class TopStoriesSyncJobTest < Minitest::Test
  describe "#perform" do
    before do
      stub_request(:get, "https://hacker-news.firebaseio.com/v0/topstories.json")
          .to_return(File.read(File.join(Rails.root, "test", "fixtures", "files", "hacker_news/TopStories/success_200.json")))
    end

    it "schedules StorySyncJob" do
      assert_equal 0, StorySyncJob.jobs.size
      TopStoriesSyncJob.new.perform
      assert_equal 10, StorySyncJob.jobs.size
    end
  end
end
