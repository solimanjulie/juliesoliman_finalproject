JuliesolimanFinalproject::Application.routes.draw do
  root "posts#home"
  resources :users, :except => [:edit, :update]
  resources :sessions, :only => [:create, :destroy, :new]
  resources :posts, :except => [:show]
  resources :follows, :only => [:new, :destroy, :show]
  resources :likes, :only => [:new, :destroy]
  resources :comments, :only => [:create]
  resources :topics, :only => [:show]

  get "/logout" => "sessions#destroy", as: 'logout'

end
