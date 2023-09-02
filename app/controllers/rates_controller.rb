class RatesController < ApplicationController

    def create
    @rate = current_user.ratings.new(rate_params)

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

