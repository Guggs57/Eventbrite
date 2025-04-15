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

  # Route d'accueil
  root "events#index"
end
