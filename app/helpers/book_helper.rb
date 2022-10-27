# frozen_string_literal: true

module BookHelper
  def newest_books(books, i)
    books.where("extract(dow from created_at) = ?", i).count
  end
end
