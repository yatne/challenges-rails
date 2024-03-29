Rails.application.routes.draw do
  resources :entries
  resources :entry_types
  devise_for :users, controllers: { registrations: "registrations" }

  resources :profiles, only: [:show, :new, :create, :update]

  root to: "main#index"
  resources :challenges

  get '/invite/:token', to: 'invitations#show'
  get '/invite/:token/accept', to: 'invitations#accept', as: 'accept_token'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the application boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the application is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
