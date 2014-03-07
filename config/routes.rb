JuliesolimanFinalproject::Application.routes.draw do
  root "posts#home"

  resources :users
  resources :sessions
  resources :posts
  resources :follows
  resources :likes
  resources :comments
  resources :topics

  get "/logout" => "sessions#destroy", as: 'logout'

end
