Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  get 'branches/products'
  get 'branches/inventory_items'
  get 'branches/premade_items'
  post 'users/user_branch/:id', to: 'users#user_branch', as: 'user_branch'
  post 'branches/update_products/:id', to: 'branches#update_products', as: 'branch_products_update'
  post 'branches/update_items/:id', to: 'branches#update_items', as: 'branch_inventory_update'
  post 'branches/update_premade_items/:id', to: 'branches#update_premade_items', as: 'branch_premade_items_update'

  resources :products, :inventory_items, :premade_items
end
