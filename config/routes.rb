Rails.application.routes.draw do


  resources :books do
    member do
      post :create_comment
      # post 'ratings', to: 'books#rate'
    end
    resources :comments, only: [:create]
  end

  resources :likes, only: [:create, :destroy]
  resources :rates, only: [:create]



  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  root 'home#index'

end
