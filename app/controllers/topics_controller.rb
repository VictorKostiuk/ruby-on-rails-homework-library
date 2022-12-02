# frozen_string_literal: true

class TopicsController < ApplicationController
  before_action :set_topic, only: %i[show edit destroy]

  def index
    @topics = Topic.all
    @new = Topic.newest
  end

  def new
    @topic = Topic.new
  end

  def show; end

  def create
    @topic = Topic.new topic_params
    if @topic.save
      redirect_back(fallback_location: root_path)
    else
      render :new
    end
  end

  def update
    if @topic.update topic_params
      redirect_to topic_path(@topic)
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to topic_path(@topic)
  end

  private

  def set_topic
    @topic = Topic.find params[:id]
  end

  def topic_params
    params.require(:topic).permit(:title, books_ids: [])
  end
end
