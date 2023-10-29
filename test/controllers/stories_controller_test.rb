require 'test_helper'

class StoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get refresh" do
    assert_equal 0, TopStoriesSyncJob.jobs.size
    get refresh_stories_url
    assert_response :redirect
    assert_equal 1, TopStoriesSyncJob.jobs.size
  end
end
