class CreateBooksTopics < ActiveRecord::Migration[7.0]
  def change
    create_join_table :books, :topics
  end
end
