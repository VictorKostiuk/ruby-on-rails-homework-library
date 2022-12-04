class KillBooksJob < ApplicationJob
  queue_as :default

  def perform
    Book.where("LENGTH(name) > 20").each { |b| b.destroy }
  end
end
