Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/calendar", to: 'pages#calendar'
  get "/my_profile", to: 'pages#my_profile'
  get "/analysis", to: 'pages#analysis'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :subscriptions do
    patch 'update_notification', to: 'subscriptions#update_notification'
      member do
        patch 'add_parasite', as: 'add_parasite'
      end
  end
  resources :parasites, only: [ :new, :create, :delete, :index, :show]
  resources :payment_methods
end
