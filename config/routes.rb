Rails.application.routes.draw do
  resources :line_items, only: [:create, :destroy]
  resources :carts, only: [:show, :destroy]

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'
  devise_for :users
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :categories, only: :show do
    resources :products, only: :show, shallow: true
  end

  # Non-Resourceful Routes
  post 'line_items/add_quantity', to: 'line_items#add_quantity'
  post 'line_items/reduce_quantity', to: 'line_items#reduce_quantity'
end
