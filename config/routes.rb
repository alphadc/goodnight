Rails.application.routes.draw do
  resources :timers
  #resources :follows
  devise_for :users
  #resources :users, :only =>[:show]
  resources :users, only: [:index, :show]
  match '/users/:id',         to: 'users#show',       via: 'get'
  post '/users/:id/follow',   to: "users#follow",     as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow",   as: "unfollow_user"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
