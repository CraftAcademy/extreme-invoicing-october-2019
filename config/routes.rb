Rails.application.routes.draw do
  devise_for :users
  resources :invoices, only: [:index, :new, :edit, :update]
  resources :customers, only: [:create, :new]
  root controller: :landing, action: :index
  resources :companies, only: [:create, :show, :new]
  resources :articles, only: [:create, :new]
end

