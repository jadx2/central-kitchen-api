# frozen_string_literal: true

Rails.application.routes.draw do
  resources :workshops

  post 'login', to: 'users#login'
  post 'signup', to: 'users#create'
end
