Rails.application.routes.draw do
  resources :yaml, only: [:new, :create], path: ''  
  root 'yaml#new'
end
