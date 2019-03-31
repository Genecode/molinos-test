Rails.application.routes.draw do

  root 'categories#index'

  resources :categories, shallow: true do
    resources :products, shallow: true
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
