require 'rails_helper'

describe AuthorBook do
  describe 'relationships' do
    it {should belong_to :author}
    it {should belong_to :song}
  end
end
