class ChargesController < ApplicationController

  def new

    @shipping = Shipping.new

    if session[:user_id] != nil
      @cart = Cart.where(user_id: session[:user_id]).first
    else
      @cart = Cart.where(id: session[:cart_id]).first
    end


    @amount = @cart.calculate_price_based_on_qty

    size= ""


    @color_options = [['Red', 1], ['Yellow', 2],
    ['Blue', 3], ['Green', 4]]


    if @amount <= 0
      redirect_to carts_path, notice: 'Please Add A Design Before Checking Out!'

    end
  end

  def create
    if session[:user_id] != nil
      @cart = Cart.where(user_id: session[:user_id]).first
    else
      @cart = Cart.where(id: session[:cart_id]).first
    end

    @amount = @cart.calculate_price_based_on_qty

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    @charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => charge_amount = (@amount * 100).to_i,
      :description => 'Rails Stripe customer',
      :currency    => 'usd',
      :receipt_email => customer.email
    )

    receipt_details = @cart.prepare_receipt_details(@amount, @charge)
    @receipt = @cart.create_receipt(receipt_details)

    @cart.mark_cart_items_purchased(@receipt.id)


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
