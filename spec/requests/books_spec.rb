require 'rails_helper'


RSpec.describe 'Books', type: :request do
  describe "Request list of all books" do
    let!(:book) { Book.create(title: 'Example Book') }

    it 'returns a successful response' do
      get books_path
      expect(response).to be_successful
      expect(response.body).to include(book.title)
    end
  end
end
