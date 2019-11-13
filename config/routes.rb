Rails.application.routes.draw do
  root 'static#landing'
  resources :shelves, only: [:show]
  resources :books, only: [:index, :show]
  resources :users
  get '/login', to: 'access#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
