# frozen_string_literal: true

class BookForm
  include ActiveModel::Model
  attr_accessor :name, :author, :image
  # :topic_ids
  validates_presence_of :name, :author

  def save
    new_book = Book.create(name: name, author: author, image: image)
    # , topic_ids: topic_ids
    create_author(new_book) if new_book
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, 'BookForm')
  end

  private

  def create_author(book)
    AuthorForm.new(title: book.author).call
  end
end
