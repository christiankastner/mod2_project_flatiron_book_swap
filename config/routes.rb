Rails.application.routes.draw do
  root 'static#landing'
  resources :books, only: [:index, :show]
  resources :users 
  
  post '/shelves/:id/private', to: "shelves#private_create", as: 'private_post'
  post '/shelves/:id/public', to: "shelves#public_create", as: 'public_post'
  post '/shelves/:id/desired', to: "shelves#desired_create", as: 'desired_post'
  get '/login', to: 'access#login'
  post 'login/authenticate', to: 'access#create'
  post 'logout', to: 'access#logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
