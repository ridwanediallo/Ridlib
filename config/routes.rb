Rails.application.routes.draw do

  get 'home/lazy_load', to: 'home#lazy_load'

  resources :books do
    member do
      post :create_comment
      # post 'ratings', to: 'books#rate'
    end
    resources :comments
  end

  resources :likes, only: [:create, :destroy]
  resources :rates, only: [:create]



  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  root 'home#index'

end
