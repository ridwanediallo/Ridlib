Rails.application.routes.draw do
  # resources :authors
  resources :authors do
    resources :books
  end
  # get '/get_books' to: 'books#get_books'
  # resources :books
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

  def get_books
    url = 'https://gutendex.com/books'
    response = RestClient.get(url)
    render json: response
  end
