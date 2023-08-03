class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  
 def index
     @page = params[:page] || 1
     conn = Faraday.new(url: 'https://gutendex.com')
     response = conn.get("/books/?page=#{@page}")
     result = JSON.parse(response.body)
     @fetched_books = result['results']
     @next_page = result['next']
     @previous_page = result['previous']
  end

end
