Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  post 'users/user_branch/:id', to: 'users#user_branch', as: 'user_branch'
  put 'branch_products/update_branch_products_list/:id', to: 'branch_products#update_branch_products_list', as: 'branch_products_update'
  put 'branch_inventories/update_branch_inventory_items_list/:id', to: 'branch_inventories#update_branch_inventory_items_list', as: 'branch_inventory_update'
  put 'branch_premade_items/update_branch_premade_items_list/:id', to: 'branch_premade_items#update_branch_premade_items_list', as: 'branch_premade_items_update'

  resources :products, :inventory_items, :premade_items
  resources :branch_products, :branch_inventories, :branch_premade_items, only: [ :index, :edit, :update ]
end
