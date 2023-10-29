require 'test_helper'

class StoriesRepositoryTest < Minitest::Test
  describe "#top_stories" do
    it "returns stories ordered by rank" do
      aa = FactoryBot.create(:story, rank: 3)
      bb = FactoryBot.create(:story, rank: 1)
      cc = FactoryBot.create(:story, rank: 2)

      stories = StoriesRepository.new.top_stories

      assert_equal [bb, cc, aa], stories.to_a
    end
  end

  describe "#story_active_comments" do
    it "returns comments that are not deleted" do
      story = FactoryBot.create(:story)
      aa = FactoryBot.create(:comment, deleted: nil, story_id: story.id)
      __ = FactoryBot.create(:comment, deleted: true, story_id: story.id)

      comments = StoriesRepository.new.story_active_comments(story.id)

      assert_equal [aa], comments.to_a
    end
  end
end
