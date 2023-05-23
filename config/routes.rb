Rails.application.routes.draw do

  resources :authors do
    resources :books
  end

  devise_for :users, controllers: {
    registrations: 'registrations'
  }

  root 'home#index'

end
