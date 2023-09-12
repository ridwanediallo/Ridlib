class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
     @fetched_books = fetch_books
  end


  def lazy_load
    @fetched_books = fetch_books
     render partial: "books/books", books: @fetched_books
  end

  private

  def fetch_books
     @page = params[:page] || 1
     conn = Faraday.new(url: 'https://gutendex.com')
     response = conn.get("/books/?page=#{@page}")
     result = JSON.parse(response.body)
     fetched_books = result['results']
  end

end
