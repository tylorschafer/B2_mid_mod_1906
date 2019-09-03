class Author < ApplicationRecord
  has_many :author_books
  has_many :books, through: :author_books

  def average_page_count
    books.average(:pages)
  end
end
