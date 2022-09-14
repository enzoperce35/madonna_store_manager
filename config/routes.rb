Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  post 'users/user_branch/:id', to: 'users#user_branch', as: 'user_branch'
  
  put 'branch_products/update_branch_products_list/:id', to: 'branch_products#update_branch_products_list', as: 'branch_products_update'
  
  get 'branches/inventory_items'
  post 'branches/update_items/:id', to: 'branches#update_items', as: 'branch_inventory_update'
  
  get 'branches/premade_items'
  post 'branches/update_premade_items/:id', to: 'branches#update_premade_items', as: 'branch_premade_items_update'

  resources :products, :inventory_items, :premade_items

  resources :branch_products, only: [ :index, :edit, :update ]
end
