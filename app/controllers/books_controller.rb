require 'net/http'

class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  def index
    @books = Book.all
  end


  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to author_books_path, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to author_books_path, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_book
      if params[:id] == "show"
        @book = Book.new
      else
       book_id = params[:id]
       @book = fetch_book(book_id)
      end
    end

    def fetch_book(book_id)
    connection = Faraday.new(url: 'https://gutendex.com')
    response = connection.get("/books/#{book_id}/")

    if response.body.present?
      JSON.parse(response.body)
    else
      puts "Empty response body received."
    end
  end

    def book_params
      params.require(:book).permit(:title, :author_id, :description, :publication_date, :image_url)
    end
end
