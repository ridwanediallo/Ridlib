class LikesController < ApplicationController
    def create
        @like = current_user.likes.new(like_params)
        if !@like.save
          flash[:notice] = @like.errors.full_messages.to_sentence
          redirect_to book_url(@like.book.book_id), notice: "Awesome! You like this book."
        end
    end

    def destroy
      @like = current_user.likes.find(params[:id])
      book = @like.book.book_id
      @like.destroy
      redirect_to book_url(@like.book.book_id), notice: "Oh! You don't like this book."
    end


    private

    def like_params
      params.require(:like).permit(:book_id)
    end


end
