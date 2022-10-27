# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new comment_params

    if @comment.save
      redirect_back(fallback_location: root_path, notice: "Your comment was successfully posted!")
    else
      redirect_back(fallback_location: root_path, notice: "Your comment wasn't posted!")
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :all_tags)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Book.find_by_id(params[:book_id]) if params[:book_id]
  end
end
