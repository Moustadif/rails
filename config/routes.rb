Rails.application.routes.draw do
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
  resources :carts, only: [:show, :destroy] do
    resources :billing_addresses
    resources :shipping_addresses
    resources :payment_types
    resources :delivery_types
    collection do
      get 'review'
    end
  end

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'
  devise_for :users
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :categories, only: :show do
    resources :products, only: :show, shallow: true
  end
end
