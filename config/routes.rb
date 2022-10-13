Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  post 'users/user_branch/:id', to: 'users#user_branch', as: 'user_branch'
  put 'branch_products/update_branch_products_list/:id', to: 'branch_products#update_branch_products_list', as: 'branch_products_update'
  put 'branch_inventories/update_branch_inventory_items_list/:id', to: 'branch_inventories#update_branch_inventory_items_list', as: 'branch_inventory_update'
  put 'branch_premade_items/update_branch_premade_items_list/:id', to: 'branch_premade_items#update_branch_premade_items_list', as: 'branch_premade_items_update'
  
  # edit and update product's inventory item and premade item
  post 'products/edit_product_inventory_item/:id', to: 'products#edit_product_inventory_item', as: 'edit_product_item'
  put 'products/update_product_inventory_item/:id', to: 'products#update_product_inventory_item', as: 'update_product_item'
  post 'products/edit_product_premade_item/:id', to: 'products#edit_product_premade_item', as: 'edit_product_premade_item'
  put 'products/update_product_premade_item/:id', to: 'products#update_product_premade_item', as: 'update_product_premade_item'
  
  post 'premade_items/edit_premade_inventory_item/:id', to: 'premade_items#edit_premade_inventory_item', as: 'edit_premade_inventory_item'
  put 'premade_items/update_premade_inventory_item/:id', to: 'premade_items#update_premade_inventory_item', as: 'update_premade_inventory_item'

  post 'branch_inventories/edit_individual_branch_inventory_items', to: 'branch_inventories#edit_individual_branch_inventory_items', as: 'edit_individual_branch_inventory_items'
  put 'branch_inventories/update_individual_branch_inventory_items', to: 'branch_inventories#update_individual_branch_inventory_items', as: 'update_individual_branch_inventory_items'
  
  post 'branch_premade_items/edit_individual_branch_premade_items', to: 'branch_premade_items#edit_individual_branch_premade_items', as: 'edit_individual_branch_premade_items'
  put 'branch_premade_items/update_individual_branch_premade_items', to: 'branch_premade_items#update_individual_branch_premade_items', as: 'update_individual_branch_premade_items'
  
  get 'home/unit_chart', as: 'unit_chart'

  resources :products, :inventory_items, :premade_items
  resources :branch_products, :branch_inventories, :branch_premade_items, only: [ :index, :edit, :update ]
end
