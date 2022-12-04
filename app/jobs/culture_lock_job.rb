class CultureLockJob < ApplicationJob
  queue_as :default

  def perform(text)
    text.split
  end
end
