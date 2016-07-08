class ContentsController < ApplicationController



  def create

  end

  def new
  end

  def destroy
  end

  def home
    @designs = Design.all

    if session[:user_id] != nil
      @user_cart = User.find(session[:user_id]).carts.first
    end

    if session[:cart_id] == nil
      @user_cart = Cart.create!(user_id: 0)
      session[:cart_id] = @user_cart.id
    else
      @user_cart = Cart.where(id: session[:cart_id]).first
    end


    @review = Review.new


  end



  def cart_area
      @selected = Design.where(:design_id => params[:design_id])
      respond_to do |format|
          format.js
      end
  end

end
