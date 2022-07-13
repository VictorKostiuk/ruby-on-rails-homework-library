Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get '/search', to: 'books#search'
  get '/orders', to: 'books#orders'
  resources :books do
    resources :comments
    member do
      patch :update_status
    end
  end
  resources :comments do
    resources :comments
  end
end
