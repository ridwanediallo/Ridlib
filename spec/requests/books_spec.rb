require 'rails_helper'


RSpec.describe 'Books', type: :request do
  describe "Get #show" do
    let!(:book) { Book.create(book_id: 1, title: 'Pride and Prejudice', author_name: 'Austen, Jane', subject: 'Courtship -- Fiction', image_url: 'https://www.gutenberg.org/cache/epub/1342/pg1342.cover.medium.jpg', download_count: 53375) }

    it 'returns a successful response' do
      get book_path(book.id)
      expect(response).to be_successful
    end
  end
end
