require 'rails_helper'

RSpec.describe "Likes", type: :request do

    describe 'POST #create' do
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

        let(:like) {
            Like.create(user_id: user.id, book_id: book.id)
        }

        it 'Should redirect to the book page' do
            sign_in user
            post likes_path, params: { like: { book_id: book.id } }
            expect(response).to redirect_to(book_url(book.book_id))
        end

        it "creates a new like" do
            sign_in user

            post likes_path, params: { like: { book_id: book.id } }

            like = Like.first();

            expect(like).to be_present
        end

        it "destroys the like" do
            sign_in user

            delete like_path(like)

            expect(response).to redirect_to(book_url(book.book_id))
            expect(flash[:notice]).to eq("Oh! You don't like this book.")
            expect { like.reload }.to raise_error(ActiveRecord::RecordNotFound)
        end
    end
end
