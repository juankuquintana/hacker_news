require 'test_helper'

class StoryCreatorTest < Minitest::Test
  describe "#call" do
    let(:reference_id) { 5000 }
    let(:comment_reference_id) { 5001 }
    let(:rank) { 5 }
    let(:story_struct) do
      HackerNews::Structs::Item.new(
          id: reference_id,
          deleted: nil,
          type: "post",
          by: "writer",
          time: 123123,
          text: "Random text",
          dead: nil,
          url: "https://",
          title: "Post title",
          kids: [comment_reference_id]
        )
    end

    before do
      stub_request(:get, "https://hacker-news.firebaseio.com/v0/item/#{comment_reference_id}.json")
          .to_return(File.read(File.join(Rails.root, "test", "fixtures", "files", "hacker_news/Item/success_comment_200.json")))
    end

    it "creates a Story" do
      StoryCreator.new.call(story_struct, rank)

      story = Story.find_by(reference_id:)
      assert_equal "Post title", story.title
    end

    it "creates a Comment" do
      StoryCreator.new.call(story_struct, rank)

      comment = Comment.last
      refute_nil comment
    end
  end
end
