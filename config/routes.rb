Rails.application.routes.draw do
  resources :requests
  root 'static#landing'
  resources :books, only: [:index, :show, :new, :create]
  resources :shelves_books, only: [:create, :destroy, :update]
  resources :users do
    resources :shelves
  end

  post '/shelves_books/swap', to: 'shelves_books#swap'
  get '/login', to: 'access#login'
  post 'login/authenticate', to: 'access#create'
  post 'logout', to: 'access#logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
