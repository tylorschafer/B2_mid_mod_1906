describe Author do
  describe 'relationships' do
    it {should have_many :author_books}
    it {should have_many(:books).through(:author_books)}
  end

  describe "instance_methods" do
    @orwell = Author.create!(name: 'George Orwell')
    @book_1 = @orwell.books.create!(title: '1984', pages: 257, publication: 1962)
    @book_3 = @orwell.books.create!(title: 'Animal Farm', pages: 125, publication: 1960)

    describe "#average_page_count" do
      it "will average the amount of pages per book the author has written" do
        expect(@orwell.average_page_count).to eq(191)
      end
    end
  end
end
