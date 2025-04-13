Rails.application.routes.draw do
  get "home/index"
  get "users/index"
  get "events/index"
  resources :users, only: [:index]
  resources :events, only: [:index]
  resources :attendances, only: [:index]

  root "home#index"

end
