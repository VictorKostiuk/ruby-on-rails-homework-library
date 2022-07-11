class Book < ApplicationRecord
  validates :name, presence: true
  validates :author, presence: true
  belongs_to :user, optional: true
  has_one_attached :image, dependent: :destroy
  STATUSES = [:in_stock, :ordered, :rented]
end