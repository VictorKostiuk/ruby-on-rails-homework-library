# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update update_status destroy]
  # before_action :set_topics, only: :create

  def index
    @books = Book.all
    @new = Book.newest
  end
  def analytics
    @books = Book.all
  end

  def orders
    @books = Book.where(status: "ordered")
    @applied_books = Book.where(status: "applied")
  end

  def update_status
    @book.update(status: params[:status])
    @order = Order.create(book_id: @book.id) if @book.status == "ordered"
    redirect_to @book
  end

  def search
    @books = Book.where("name LIKE ?", "%#{params[:q]}%")
  end

  def new
    @book = BookForm.new
  end

  def edit; end

  def show; end

  def create
    @book = BookForm.new(book_params)
    redirect_to books_path if @book.save
  end

  def update
    if @book.update book_params
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to book_path(@book)
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book_form).permit(:name, :author, :image, :status, :description)
  end

  # def topic_params
  #   params.require(:book_form).permit(topic_ids: [])
  # end

  def set_topics
    @topics = Topic.where(id: topic_params[:topic_ids])
  end
end
