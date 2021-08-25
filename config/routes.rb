Rails.application.routes.draw do
  resources :workshops
  resources :attendances
  resources :users, only: [:create]
  resources :authentication, only: [:create]
end
