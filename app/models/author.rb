class Author < ApplicationRecord
  has_many :author_books
  has_many :books, through: :author_books

  validates_presence_of :name

  def average_page_count
    books.average(:pages)
  end
end
