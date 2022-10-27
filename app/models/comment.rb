# frozen_string_literal: true

class Comment < ApplicationRecord
  include TagsConcern
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  has_many :taggings
  has_many :tags, through: :taggings
end
