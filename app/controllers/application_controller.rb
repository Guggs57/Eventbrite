class ApplicationController < ActionController::Base
  before_action :authenticate_user! # Assurez-vous que l'utilisateur est connecté
end
