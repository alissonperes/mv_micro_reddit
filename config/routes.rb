Rails.application.routes.draw do
  resources 'users'
  resources 'posts'
  resources 'comments'
  root 'posts#index'
  # get 'comments/new'
  # get 'posts/new'
  # get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
