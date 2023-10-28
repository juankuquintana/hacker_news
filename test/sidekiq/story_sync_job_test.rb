require 'test_helper'
require "minitest/autorun"

class StorySyncJobTest < Minitest::Test
  describe "#perform" do
    let(:id) { 38050106 }

    before do
      stub_request(:get, "https://hacker-news.firebaseio.com/v0/item/#{id}.json")
          .to_return(File.read(File.join(Rails.root, "test", "fixtures", "files", "hacker_news/Item/success_story_200.json")))
    end

    it "delegates to StoryCreator" do
      StoryCreator.any_instance.expects(:call).once

      StorySyncJob.new.perform(id)
    end
  end
end
