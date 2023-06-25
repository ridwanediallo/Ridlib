Rails.application.routes.draw do

  resources :books


  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  root 'home#index'

end
