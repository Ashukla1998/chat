Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users , controllers: {
    sessions: 'users/sessions'
  }
  # get 'products/index'
  # get 'products/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "products#index"
  resources :products
  resource :cart, only: [:show]
  post '/add_to_cart/:product_id', to: 'carts#add_to_cart', as: 'add_to_cart'
  delete '/remove_from_cart/:id', to: 'carts#remove_from_cart', as: 'remove_from_cart'

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
