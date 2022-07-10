Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get '/search', to: 'books#search'
  resources :books
end
