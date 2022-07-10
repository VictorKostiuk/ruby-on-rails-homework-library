class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  def index
    @books = Book.all
  end

  def search
    @books = Book.where("name LIKE ?", "%" + params[:q] + "%")
  end

  def new
    @book = Book.new
  end

  def edit; end

  def show; end

  def create
    @book = Book.new book_params
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
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

  def book_params
    params.require(:book).permit(:name, :author, :image)
  end

  def set_book
    @book = Book.find params[:id]
  end
end
