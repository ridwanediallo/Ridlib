Rails.application.routes.draw do


  resources :books do
    member do
      post :create_comment

    end
    resources :comments, only: [:create]
  end

  resources :likes, only: [:create, :destroy]



  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  root 'home#index'

end
