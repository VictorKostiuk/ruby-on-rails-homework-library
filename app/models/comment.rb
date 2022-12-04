# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  after_create :check_text

  private

  def check_text
    Delayed::Job.enqueue(CultureLockJob.new(self), :run_at => 2.seconds.from_now)
  end
end
