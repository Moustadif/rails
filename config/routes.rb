Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'
  devise_for :users
  resources :categories, only: :show do
    resources :products, only: :show, shallow: true
  end
  resources :delivery_types
  resources :payment_types
  resources :billing_addresses
  resources :shipping_addresses
  resources :line_items, only: [:create, :destroy] do
    collection do
      post 'add_quantity'
      end
    collection do
      post 'reduce_quantity'
    end
  end
  resources :carts, only: [:show] do
    collection do
      get 'review'
      post 'place_order'
      get 'confirmation'
    end
  end
  root to: 'home#index'
end
