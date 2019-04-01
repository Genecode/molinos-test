Rails.application.routes.draw do
  devise_for :admins

  root 'categories#index'

  resources :categories, shallow: true do
    resources :products, shallow: true
  end
end
