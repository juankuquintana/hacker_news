class StoriesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @stories = StoriesRepository.new.top_stories
  end

  def show
    @story = Story.find(params[:id])
    @comments = StoriesRepository.new.story_active_comments
  end

  def refresh
    TopStoriesSyncJob.perform_async
    redirect_to root_path
  end

  private

  def record_not_found
    flash[:alert] = "Story not found."
    redirect_to root_path
  end
end
