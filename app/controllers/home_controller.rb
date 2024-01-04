class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:index]

def index
    @page = params[:page] || 1
    @topic = params[:topic]

    conn = Faraday.new(url: 'https://gutendex.com')
    response = conn.get("/books/?page=#{@page}&topic=#{@topic}")
    result = JSON.parse(response.body)
    @fetched_books = result['results']
    @next_page = result['next']
    @previous_page = result['previous']
end


  def search
    search_query = params[:q]
    @page = params[:page] || 1

    if search_query.present?
      conn = Faraday.new(url: 'https://gutendex.com')
      response = conn.get("/books/?search=#{search_query}&page=#{@page}")
      result = JSON.parse(response.body)
      @fetched_books = result['results']

    if @fetched_books.empty?
      flash.now[:alert] = "We don't have a book with title: '#{search_query}'"
    end
    else
      @fetched_books = []
    end

    render :index
  end


  private

  def fetch_books_by_topic(topic)
    conn = Faraday.new(url: 'https://gutendex.com')
    response = conn.get("/books/?topic=#{topic}")
    result = JSON.parse(response.body)
    result['results']
  end
end
