Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :edit, :show, :destroy, :pay] do
    resources :transactions, only: [:index]
  end
  resources :users, only: [:create, :new]
end
