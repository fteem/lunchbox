Rails.application.routes.draw do
  namespace :api, default: { format: :json } do
    namespace :v1 do
      resources :lunches

      devise_for :users
    end
  end

  root 'home#index'
end
