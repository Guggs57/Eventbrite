Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:index]
  resources :attendances, only: [:index]

  root "home#index"

end
