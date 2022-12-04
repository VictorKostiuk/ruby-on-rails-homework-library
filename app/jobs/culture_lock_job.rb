class CultureLockJob < ApplicationJob
  queue_as :default
  SOME_WORDS = ['kurwa']
  def perform(comment)
    text = comment.body
    new_text = text.split(' ').map do |word|
      SOME_WORDS.include?(word) ? word.reverse : word
    end
    comment.update!(body: new_text.join(' '), censored: true)
  end
end
