class CheckoutsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @user = current_user
      @total = params[:total].to_d
      @event_id = params[:event_id]
  
      # Créer une session Stripe
      @session = Stripe::Checkout::Session.create(
        payment_method_types: ["card"],
        line_items: [
          {
            price_data: {
              currency: "eur",
              unit_amount: (@total * 100).to_i,  # Conversion en centimes
              product_data: {
                name: "Rails Stripe Checkout"
              }
            },
            quantity: 1
          }
        ],
        mode: "payment",
        success_url: checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
        cancel_url: checkout_cancel_url + "?session_id={CHECKOUT_SESSION_ID}",
        metadata: {
          event_id: @event_id  # Met l'ID de l'événement dans les métadonnées
        }
      )
  
      # Rediriger l'utilisateur vers Stripe Checkout
      redirect_to @session.url, allow_other_host: true
    end
  
    def success
      # Récupérer la session Stripe après le succès du paiement
      @session = Stripe::Checkout::Session.retrieve(params[:session_id])
      @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
      @event_id = @session.metadata.event_id
  
      # Trouver l'ordre en fonction de l'ID de l'événement
      order = Order.find_by(event_id: @event_id)
  
      if order && order.status == "pending"
        order.update(status: "validated")  # Valider la commande
        # Vous pouvez ajouter des actions supplémentaires ici si nécessaire
      end
    end
  
    def cancel
      # Annuler l'ordre en fonction de l'ID de l'événement
      @order = current_user.orders.find_by(event_id: @event_id)
      if @order && @order.status == "pending"
        @order.update(status: "cancelled")
        @order.destroy  # Supprimer l'ordre
      end
      redirect_to checkout_cancel_url, allow_other_host: true
    end
  end
  