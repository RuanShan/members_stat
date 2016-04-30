Rails.application.routes.draw do
  resources :daily_settings
  resources :sales
  resources :customers
  resources :posts
  resources :days do
    collection do
      get :select
    end
  end

  root :to => 'days#select'

  devise_for :users
  resources :users
end
