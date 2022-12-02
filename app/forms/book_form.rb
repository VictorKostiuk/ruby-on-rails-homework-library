# frozen_string_literal: true

class BookForm
  include ActiveModel::Model
  attr_accessor :name, :author, :topic_ids, :image

  validates_presence_of :name, :author

  # def save
  #   new_book = Book.new(name: name, author: author, topic_ids: topic_ids, image: image)
  #   AuthorForm.new(title: new_book.author).call
  # end

  def self.model_name
    ActiveModel::Name.new(self, nil, 'BookForm')
  end

  # def initialize(params = {})
  #   @book = Book.new
  #   super(params)
  #   @terms_of_service ||= false
  # end
  #
  # def submit
  #   return false if invalid?
  #   AuthorForm.new(title: @book.author).call
  #   true
  # end
end
