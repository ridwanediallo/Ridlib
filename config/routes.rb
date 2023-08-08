Rails.application.routes.draw do
  resources :likes


  resources :books do
    resources :comments, only: [:create]
  end



  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  root 'home#index'

end
