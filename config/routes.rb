Rails.application.routes.draw do
  root :to => 'dashboard#index'
  get 'dashboard/index'

  resources :days
  resources :sales do as_routes end
  resources :customers do as_routes end
  resources :effective_configs do as_routes end
  devise_for :users
  resources :users
end
