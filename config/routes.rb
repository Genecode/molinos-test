Rails.application.routes.draw do
  devise_for :admins

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'categories#index'

  resources :categories, shallow: true do
    resources :products, shallow: true
  end
end
