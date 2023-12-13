require 'rails_helper'

RSpec.describe Comment, type: :model do
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
    Comment.new(
      user_id: user.id,
      book_id: book.id,
      comment: 'This is a comment'
    )
  }


  it "Comment should be present" do
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

  it "Comment should be present" do
    subject.comment = 'This is a comment'
    expect(subject).to be_valid
  end

  it "Should not be greater than 250 characters" do
    subject.comment = 'a' * 251
    expect(subject).to_not be_valid
  end

  it "Comment should be maximum 250 characters" do
    subject.comment = 'a' * 250
    expect(subject).to be_valid
  end

  it "Should not be less than 5 characters" do
    subject.comment = 'a' * 3
    expect(subject).to_not be_valid
  end

end
