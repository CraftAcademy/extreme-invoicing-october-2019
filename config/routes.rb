Rails.application.routes.draw do
  devise_for :users
  resources :invoices, only: [:index, :show, :new, :update]
  resources :customers, only: [:create, :new]
  root controller: :landing, action: :index
  resources :companies, only: [:create, :show, :new]
  resources :articles, only: [:create, :new]
  resources :payments, only: [:new, :create]
end

