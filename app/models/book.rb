class Book < ApplicationRecord
  validates :name, presence: true
  validates :author, presence: true
  belongs_to :user, optional: true
  has_many :orders
  has_one_attached :image, dependent: :destroy
  STATUSES = [:ready_for_order, :ordered, :applied]
end