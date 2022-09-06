Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  post 'users/user_branch/:id', to: 'users#user_branch', as: 'user_branch'

  resources :products
end
