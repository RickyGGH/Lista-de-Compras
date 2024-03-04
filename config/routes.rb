Rails.application.routes.draw do
  root to: 'shopping_lists#index'
  resources :products, only: [:create, :update]
  resources :shopping_lists, only: [:index, :create, :update]
end
