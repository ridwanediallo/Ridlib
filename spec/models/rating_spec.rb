require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) {
    User.create(name: 'Ridwan', email: 'ridwane@gmail.com', password: '123456', password_confirmation: '123456')
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

  it "Raiting should be present" do
    expect(subject).to be_valid
  end

  it "Book should be present" do
    subject.book = nil
    expect(subject).to_not be_valid
  end

  it "User should be present" do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it "Rating should be present" do
    subject.rating = 5
    expect(subject).to be_valid
  end

  it "Should not be greater than 5" do
    subject.rating = 6
    expect(subject).to_not be_valid
  end

  it "Should not be less than 1" do
    subject.rating = 0
    expect(subject).to_not be_valid
  end

  it "Rating should be maximum 5" do
    subject.rating = 5
    expect(subject).to be_valid
  end

  it "Rating should be minimum 1" do
    subject.rating = 1
    expect(subject).to be_valid
  end

  it "Rating should be between 1 and 5" do
    subject.rating = 3
    expect(subject).to be_valid
  end

  it "Rating should be an integer" do
    subject.rating = 'rating'
    expect(subject).to_not be_valid
  end

end
