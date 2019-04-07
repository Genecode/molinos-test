Rails.application.routes.draw do
  devise_for :admins

  namespace :private do
    root 'categories#index'
    resources :categories, except: %i[show] do
      post 'commit', on: :collection
      resources :products, shallow: true
    end
  end

  root 'categories#index'
  resources :categories, only: %i[index show]
end
