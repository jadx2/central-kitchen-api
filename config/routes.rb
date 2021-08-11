# frozen_string_literal: true

Rails.application.routes.draw do
  resources :workshops

  post 'authenticate', to: 'authentication#create'
end
