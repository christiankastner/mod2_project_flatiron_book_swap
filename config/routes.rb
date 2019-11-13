Rails.application.routes.draw do
  root 'static#landing'
  resources :books, only: [:index, :show]
  resources :users do
    resources :shelves, only: [:show]
  end
  get '/login', to: 'access#login'
  post 'login/authenticate', to: 'access#create'
  post 'logout', to: 'access#logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
