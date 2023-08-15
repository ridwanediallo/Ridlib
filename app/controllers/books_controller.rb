require 'net/http'

class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  def index
    @books = Book.all
  end


  def show
     @book_comment = Comment.includes(:book, :user).all
     @comment = Comment.new
      # Fetch the book from the API
      gutenburg_book_id = params[:id]

      @book = Book.find_by(book_id: gutenburg_book_id)

     # If the book is not found in the database, fetch and save it
    if @book.nil?
       @gutenburg_book = GutenburgBook.fetch_book(gutenburg_book_id)

    # Create and save the book in the database
       @book = Book.new(
                  book_id: @gutenburg_book["id"],
                  title: @gutenburg_book["title"],
                  # author_name: @gutenburg_book["authors"][0]['name'],
                  subject: @gutenburg_book["subjects"][0],
                  image_url: @gutenburg_book["formats"]["image/jpeg"],
                  download_count: @gutenburg_book["download_count"] )
    end
    @book.save!
  end

    def create_comment
       @comment = Comment.new(comment_params)
       @comment.user = current_user

       # Fetch the book from the database based on book_id
       @book = Book.find_by(book_id: params[:id])

       @comment.book = @book

      if @comment.book.nil?
        flash[:error] = "Book not found."
        redirect_to root_url
        return
      end
      # book_url(book) => same as book_url(book.to_param) same as book_url(book.id)
      # book_url(12)
      # /book/12

       respond_to do |format|
         if @comment.save
           format.html { redirect_to book_url(@comment.book.book_id), notice: "Comment was successfully created." }
           format.json { render :show, status: :created, location: @comment }
         else
           format.html { render :show, status: :unprocessable_entity }
           format.json { render json: @comment.errors, status: :unprocessable_entity }
         end
       end
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
       gutenburg_book_id = params[:id]
       @book = GutenburgBook.fetch_book(gutenburg_book_id)
      end
    end

    def book_params
      params.require(:book).permit(:title, :author_id, :description, :publication_date, :image_url)
    end

    def comment_params
      params.require(:comment).permit(:comment, :user_id, :book_id)
    end
end
