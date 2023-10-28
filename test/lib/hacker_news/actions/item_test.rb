require "test_helper"

class HackerNews::Actions::ItemTest < ActiveSupport::TestCase
  describe "#call" do
    let(:id) { 38050106 }

    before do
      stub_request(:get, "https://hacker-news.firebaseio.com/v0/item/#{id}.json")
          .to_return(File.read(File.join(Rails.root, "test", "fixtures", "files", "hacker_news/Item/success_story_200.json")))
    end

    it "builds the correct request" do
      HackerNews::Actions::Item.new.call(id)

      assert_requested :get, "https://hacker-news.firebaseio.com/v0/item/#{id}.json"
    end

    it "returns an Item" do
      result = HackerNews::Actions::Item.new.call(id)

      assert_kind_of HackerNews::Structs::Item, result
      assert_equal(result.id, 38050106)
      assert_equal(result.descendants, 30)
      assert_equal(result.by, "selvan")
      assert_kind_of Array, result.kids
      assert_equal(result.score, 181)
      assert_equal(result.time, 1698503579)
      assert_equal(result.title, "MagicaVoxel A free voxel art editor and interactive path tracing renderer")
      assert_equal(result.type, "story")
      assert_equal(result.url, "https://ephtracy.github.io/")
    end
  end
end
