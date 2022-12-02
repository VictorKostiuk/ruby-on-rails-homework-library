class Author < ApplicationRecord
  validates :title, uniqueness: true
end