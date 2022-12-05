class CultureLockJob < ApplicationJob
  queue_as :default

  def perform(params)
    sleep 10
    params[:body].gsub('kurwa', 'awruk')
    params[:censored] = true
    params
  end
  def perform(comment)
    text = comment.body
    new_text = text.split(' ').map do |word|
      SOME_WORDS.include?(word) ? word.reverse : word
    end
    comment.update!(body: new_text.join(' '), censored: true)
  end
end
