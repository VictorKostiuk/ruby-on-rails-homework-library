# frozen_string_literal: true
class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def create
    @author = AuthorForm.new(author_params).call
    if @author.save
      redirect_back(fallback_location: root_path)
    else
      render :new
    end
  end

  private

  def author_params
    params.require(:book).permit(:title)
  end
end
