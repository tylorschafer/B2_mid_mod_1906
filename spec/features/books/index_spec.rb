require 'rails_helper'

describe 'Book Index Page' do
  before :each do
    @orwell = Author.create!(name: 'George Orwell')
    @book_1 = @orwell.books.create!(title: '1984', pages: 257, publication: 1962)
    @martin = Author.create!(name: 'George R. R. Martin')
    @book_2 = @martin.books.create!(title: 'Game of Thrones', pages: 10002, publication: 1992)
  end
  it "I see each book in the system and its corresponding details" do

    visit '/books'

    within "#book-#{@book_1.id}" do
      expect(page).to have_content("Title: #{@book_1.title}")
      expect(page).to have_content("Number of Pages: #{@book_1.pages}")
      expect(page).to have_content("Publication Year: #{@book_1.publication}")
      expect(page).to have_content("Author(s): #{@orwell.name}")
      expect(page).to have_link(@orwell.name)
      end

    within "#book-#{@book_2.id}" do
      expect(page).to have_content("Title: #{@book_2.title}")
      expect(page).to have_content("Number of Pages: #{@book_2.pages}")
      expect(page).to have_content("Publication Year: #{@book_2.publication}")
      expect(page).to have_content("Author(s): #{@martin.name}")
      expect(page).to have_link(@martin.name)
    end
  end
end
