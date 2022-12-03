class PostAnalyticJob < ApplicationJob
  queue_as :default

  def perform(description)
    @sentences = description.index('.')
    @words = description.split.length
    @letters = description.split.join.length
    return "There are #{@sentences} sentences, #{@words} words, #{@letters} letters."
  end
end
