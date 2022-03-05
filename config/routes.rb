Rails.application.routes.draw do
  namespace :api do
    get 'login', to: 'control#login'
    get 'logout', to: 'control#logout'
    get 'index', to: 'control#index'
    get 'users', to: 'control#users'
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
