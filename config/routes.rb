Rails.application.routes.draw do
  resources :books
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
