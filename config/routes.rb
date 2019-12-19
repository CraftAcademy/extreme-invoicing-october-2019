Rails.application.routes.draw do
  devise_for :users
  resources :invoices, only: [:index, :new, :edit]
  resources :customers, only: [:create, :new]
  root controller: :landing, action: :index
end

