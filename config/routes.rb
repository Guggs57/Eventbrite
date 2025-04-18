Rails.application.routes.draw do
  # Routes pour l'authentification des utilisateurs avec Devise
  devise_for :users

  # Routes pour les utilisateurs, avec des actions show, edit, update et custom pour le profil
  resources :users, only: [:show, :edit, :update] do 
    member do
      get :edit_profile
      patch :update_profile
    end
  end

  # Routes pour les événements
  resources :events

  # Routes pour les participations (attendances)
  resources :attendances, only: [:index]

  # Routes authentifiées pour l'utilisateur connecté (profil)
  authenticate :user do 
    resources :users, only: [:show]
  end

  # Route stripe
  scope '/checkout' do
    post 'create', to: 'checkouts#create', as: 'checkout_create'
    get 'success', to: 'checkouts#success', as: 'checkout_success'
    get 'cancel', to: 'checkouts#cancel', as: 'checkout_cancel'
  end

  resources :events
  

  # Route d'accueil
  root "events#index"
end
