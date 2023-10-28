require "test_helper"

class HackerNews::Actions::TopStoriesTest < ActiveSupport::TestCase
  describe "#call" do
    before do
      stub_request(:get, "https://hacker-news.firebaseio.com/v0/topstories.json")
          .to_return(File.read(File.join(Rails.root, "test", "fixtures", "files", "hacker_news/TopStories/success_200.json")))
    end

    it "builds the correct request" do
      HackerNews::Actions::TopStories.new.call

      assert_requested :get, "https://hacker-news.firebaseio.com/v0/topstories.json"
    end

    it "returns an array of IDs" do
      result = HackerNews::Actions::TopStories.new.call

      assert_kind_of Array, result
      assert_kind_of Integer, result.first
    end
  end
end
