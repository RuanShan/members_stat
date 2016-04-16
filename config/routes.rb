Rails.application.routes.draw do
  resources :effective_configs do as_routes end
  root :to => 'dashboard#index'
  get 'dashboard/index'

  get 'days/index'

  resources :sales do as_routes end
  resources :customers do as_routes end
  devise_for :users
  resources :users
end
