Rails.application.routes.draw do

  resources :books do
    resources :comments
  end

  resources :likes, only: [:create, :destroy]
  resources :rating, only: [:create]

  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  root 'home#index'
  get '/search', to: 'home#search', as: 'search_books'
end
