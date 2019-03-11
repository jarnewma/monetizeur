Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [ :show, :new, :create, :edit ]
  resources :subscriptions
  resources :parasites, only: [ :new, :create, :delete ]
  resources :payment_methods
end
