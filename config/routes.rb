Rails.application.routes.draw do
  root to: "main#index"
  devise_for :users
  resources :mains
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
