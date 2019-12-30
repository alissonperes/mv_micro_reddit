Rails.application.routes.draw do
  resources 'users'
  resources 'posts'
  resources 'comments'
  root 'posts#index'
  get '/signup', to: 'users#new'
end
