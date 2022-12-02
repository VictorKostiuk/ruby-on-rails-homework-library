# frozen_string_literal: true

class AuthorForm
  include ActiveModel::Model

  validates :title, presence: true, length: { minimum: 2 }

  def initialize(title)
    @title = title
  end

  def call
    Author.create(title: @title.values[0]) if Author.find_by(title: @title.values[0]).nil?
  end
end
