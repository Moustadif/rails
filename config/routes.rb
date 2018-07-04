Rails.application.routes.draw do
  get 'product/show'
  get 'category/show'
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
