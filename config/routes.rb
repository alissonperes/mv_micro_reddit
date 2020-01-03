Rails.application.routes.draw do
  root 'posts#index'
  resources 'users'
  resources 'posts'
  resources 'comments'
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
