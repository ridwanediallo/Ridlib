class RatingController < ApplicationController
   before_action :authenticate_user!, only: [:create]

    def create

      @rate = current_user.ratings.find_by(book_id: rate_params[:book_id])

      if @rate
        @rate.rating = rate_params[:rating]
      else
        @rate = current_user.ratings.new(rate_params)
      end

    respond_to do |format|
      if @rate.save
        format.html { redirect_to book_url(@rate.book.book_id), notice: "Rate was successfully created." }
        format.json { render :show, status: :created, location: @rate }
        format.js
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @rate.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

    private

    def rate_params
      params.require(:rating).permit(:rating, :book_id)
    end

end

