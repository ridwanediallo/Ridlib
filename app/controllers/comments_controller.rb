class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  def index
    @comments = Comment.includes(:book, :user).all
  end

  def show
    @comment = Comment.includes(:book, :user).find(params[:id])
  end

  def edit
    @book = Book.find_by(book_id: params[:book_id])
    render locals: { book: @book }
  end
  
  def new
    @book = Book.find_by(book_id: params[:book_id])
    @comment = Comment.new(book: @book)
  end

  def create
       @comment = Comment.new(comment_params)
       @comment.user = current_user

       # Fetch the book from the database based on book_id
       @comment.book = Book.find_by(book_id: params[:book_id])

      if @comment.book.nil?
        flash[:error] = "Book not found."
        redirect_to root_url
        return
      end

       respond_to do |format|
         if @comment.save
           format.html { redirect_to book_url(@comment.book), notice: "Comment was successfully created." }
           format.json { render :show, status: :created, location: @comment }
         else
           format.html { render :new, status: :unprocessable_entity }
           format.json { render json: @comment.errors, status: :unprocessable_entity }
         end
       end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to book_url(@comment.book.book_id), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to book_url(@comment.book.book_id), notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:comment, :user_id, :book_id)
    end
end
