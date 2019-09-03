require 'rails_helper'

describe 'Author Show Page' do
  before :each do
    @orwell = Author.create!(name: 'George Orwell')
    @book_1 = @orwell.books.create!(title: '1984', pages: 257, publication: 1962)
    @book_3 = @orwell.books.create!(title: 'Animal Farm', pages: 125, publication: 1960)
    @martin = Author.create!(name: 'George R. R. Martin')
    @book_2 = @martin.books.create!(title: 'Game of Thrones', pages: 10002, publication: 1992)
  end

  describe "After clicking an authors name I am taken to their show page" do
    it "where I see information on that author" do

      visit '/books'

      within "#book-#{@book_1.id}" do
        click_link("#{@orwell.name}")
      end

      expect(current_path).to eq("/authors/#{@orwell.id}")

      expect(page).to have_content(@orwell.name)
      expect(page).to_not have_content(@martin.name)
      expect(page).to have_content("Books: #{@book_1.title} #{@book_3.title}")
      expect(page).to have_link(@book_1.title)
      expect(page).to have_link(@book_3.title)
      expect(page).to have_content("Average Page Count: 191")
    end
  end
end
