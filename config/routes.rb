Rails.application.routes.draw do
  resources :users, only: [:index]
  resources :events, only: [:index]
  resources :attendances, only: [:index]

  root "home#index"

end
