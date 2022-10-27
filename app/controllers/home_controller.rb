# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @books = Book.all
    @new = Book.newest
  end
end
