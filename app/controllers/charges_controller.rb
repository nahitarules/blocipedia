class ChargesController < ApplicationController

<<<<<<< HEAD
=======

>>>>>>> stripe
  def create
    @amount = 1500

    customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )

   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: @amount,
     description: "BigMoney Membership - #{current_user.email}",
     currency: 'usd'
   )

   flash[:notice] = "Thanks for upgrading to premium, #{current_user.email}! Feel free to pay me again."
   current_user.update_attribute(:role, 'premium')
   redirect_to root_path # or wherever

   # Stripe will send back CardErrors, with friendly messages
   # when something goes wrong.
   # This `rescue block` catches and displays those errors.
   rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to new_charge_path

  end

  def new
    @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Premium Memebership - #{current_user.email}",
     amount: @amount
   }
  end
end
