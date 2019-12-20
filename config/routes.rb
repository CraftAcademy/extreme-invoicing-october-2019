# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :invoices, only: %i[index new edit update] do
    resources :invoice_rows, only: %i[create new], as: :rows
  end
  resources :customers, only: %i[create new]
  root controller: :landing, action: :index
  resources :companies, only: %i[create show new]
  resources :articles, only: %i[create new]
end
