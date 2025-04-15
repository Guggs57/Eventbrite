class UsersController < ApplicationController
  before_action :authenticate_user!  # S'assure que l'utilisateur est connecté avant d'accéder à la méthode show
  before_action :correct_user, only: [:show, :edit, :update]  # Limite l'accès à la page profil à l'utilisateur connecté

  def show
    @user = current_user  # Récupère l'utilisateur connecté
    @events = @user.events  # Récupère tous les événements créés par cet utilisateur
  end
  

  def edit
    @user = current_user  # Récupère l'utilisateur connecté pour l'édition de son profil
    # Si l'utilisateur n'est pas le bon, redirige vers la page d'accueil
    redirect_to(root_url) unless current_user == @user
  end

  def update
    @user = current_user  # Récupère l'utilisateur connecté pour mettre à jour son profil
    if @user.update(user_params)
      redirect_to @user, notice: 'Profil mis à jour avec succès.'
    else
      render :edit  # En cas d'erreur de validation, redirige vers le formulaire d'édition
    end
  end

  private

  def user_params
    if params[:user][:password].present?
      params.require(:user).permit(:first_name, :last_name, :description, :email, :password, :password_confirmation, :current_password)
    else
      params.require(:user).permit(:first_name, :last_name, :description, :email)
    end
  end
  
  

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user == @user
  end
end
