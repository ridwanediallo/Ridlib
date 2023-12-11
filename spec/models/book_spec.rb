require 'rails_helper'

RSpec.describe Book, type: :model do

 let(:user) {
    User.create(name: 'Ridwan', email: 'ridwane@gmail.com', password: '123456', password_confirmation: '123456')
  }

  subject {
    Book.new(
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

  before { subject.save }

  it "Title should be present" do
    subject.title = 'The Great Gatsby'
    expect(subject).to be_valid
  end

  it "Description should be present" do
    subject.description = 'The Great Gatsby is a novel by American writer F. Scott Fitzgerald'
    expect(subject).to be_valid
  end

  it "Author name should be present" do
    subject.author_name = 'F. Scott Fitzgerald'
    expect(subject).to be_valid
  end

  it "Subject should be present" do
    subject.subject = 'Fiction'
    expect(subject).to be_valid
  end

  it "Image url should be present" do
    subject.image_url = 'https://www.gutenberg.org/cache/epub/25501/pg25501.cover.medium.jpg'
    expect(subject).to be_valid
  end

  it "Download count should be present" do
    subject.download_count = 100
    expect(subject).to be_valid
  end

#   it "should be invalid with a non-unique book_id" do
#     subject.save
#     duplicate_book = subject.dup
#     expect(duplicate_book).to_not be_valid
#   end

end
