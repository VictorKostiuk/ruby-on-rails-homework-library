# frozen_string_literal: true

class Book < ApplicationRecord
  include Newest
  validates :name, presence: true
  validates :author, presence: true
  belongs_to :user, optional: true
  has_many :orders
  has_many :comments, as: :commentable
  has_one_attached :image, dependent: :destroy
  STATUSES = %i[ready_for_order ordered applied].freeze
end
