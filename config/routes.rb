Rails.application.routes.draw do
  resources :lunches

  devise_for :users
  root 'home#index'
end
