require 'rails_helper'

RSpec.describe Rating, type: :request do

  describe "Rating #create" do

   let(:user) {
    User.create(name: 'Ridwan', email: 'ridwanediallo99@gmail.com', password: '123456', password_confirmation: '123456')
  }

  let(:book) {
    Book.create(
      book_id: 1,
      user_id: user.id,
      title: 'The Great Gatsby',
      description: 'The Great Gatsby is a novel by American writer F. Scott Fitzgerald',
      publication_date: '1925-04-10',
      author_name: 'F. Scott Fitzgerald',
      subject: 'Fiction',
      image_url: 'https://www.gutenberg.org/cache/epub/25501/pg25501.cover.medium.jpg',
      download_count: 100
    )
  }

  subject {
    Rating.new(
      user_id: user.id,
      book_id: book.id,
      rating: 5
    )
  }

    it 'creates a rating with the lowest valid rating' do
        sign_in user

        post  rating_index_path, params: { rating: { book_id: book.id, rating: 1 } }

        follow_redirect!

        expect(response).to be_successful
    end

    it 'creates a rating with the highest valid rating' do
        sign_in user

        post  rating_index_path, params: { rating: { book_id: book.id, rating: 5 } }

        follow_redirect!

        expect(response).to be_successful
    end

    it 'redirects unauthenticated users to the login page' do
       post rating_index_path, params: { rating: { book_id: book.id, rating: 5 } }

      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
