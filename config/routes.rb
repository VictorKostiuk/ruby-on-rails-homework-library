Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get '/search', to: 'books#search'
  get '/orders', to: 'books#orders'
  resources :books do
    member do
      patch :update_status
    end
  end
end
