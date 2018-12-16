class WelcomeController < ApplicationController

  def index
  end

  def create


  end

  def success
    @amount = 500

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => 'Blocipdia Premium Customer',
      :currency => 'usd'
    )

    user = current_user
    user.role = "premium"
    user.save

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to welcome_index_path
  end

  def downgrade
    user = current_user
    id = user.id
    user.role = "standard"
    user.save
    Wiki.where(user_id: id).update_all(private: 'false')
  end



  def about
  end

end
