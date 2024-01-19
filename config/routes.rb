Rails.application.routes.draw do
  root to: "main#index"
  resources :mains
  resources :challenges
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the application boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the application is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
