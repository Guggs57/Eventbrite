class EventsController < ApplicationController
  before_action :set_event, only: [:show, :destroy]

  def index
    @events = Event.all
  end

  def show
    # Affichage de l'événement
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creator = current_user # Associe l'utilisateur comme créateur de l'événement
    if @event.save
      redirect_to event_path(@event), notice: "Ton événement est bien enregistré."
    else
      render :new
    end
  end

  def destroy
    # Vérifie si l'utilisateur actuel est le créateur de l'événement
    if @event.creator == current_user
      @event.destroy
      redirect_to events_path, notice: "Événement supprimé avec succès."
    else
      redirect_to events_path, alert: "Vous ne pouvez pas supprimer cet événement."
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :location, :date, :price)
  end
  
end
