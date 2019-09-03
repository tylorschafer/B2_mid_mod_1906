require 'rails_helper'

describe 'Book Index Page' do
  before :each do
    @orwell = Author.create!(name: 'George Orwell')
    @book_1 = @orwell.books.create!(title: '1984', pages: 257, publication: 1962)
    @martin = Author.create!(name: 'George R. R. Martin')
    @book_2 = @martin.books.create!(title: 'Game of Thrones', pages: 10002, publication: 1992)
    @books = [@book_1,@book_2]
  end
  it "I see each book in the system and its corresponding details" do

    visit '/books'

    @books.each do |book|
      within "#book-#{book.id}" do
        expect(page).to have_content("Title: #{book.title}")
        expect(page).to have_content("Number of Pages: #{book.pages}")
        expect(page).to have_content("Publication Year: #{book.publication}")
        expect(page).to have_content("Author(s): #{book.authors.name}")
      end
    end
  end
end
