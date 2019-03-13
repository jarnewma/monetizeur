Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/calendar", to: 'pages#calendar'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :subscriptions do
      member do
        patch 'add_parasite', as: 'add_parasite'
      end
  end
  resources :parasites, only: [ :new, :create, :delete ]
  resources :payment_methods
end
