Rails.application.routes.draw do
  apipie
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :products, only: :index
      resources :shops, only: [:show, :create, :update, :destroy]
    end
  end
end
