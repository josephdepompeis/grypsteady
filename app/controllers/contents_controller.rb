class ContentsController < ApplicationController



  def create

  end

  def new
  end

  def destroy
  end

  def home

  @designs = Design.all
  @user_cart = User.find(session[:user_id]).carts.first

  end



  def cart_area
      @selected = Design.where(:design_id => params[:design_id])
      respond_to do |format|
          format.js
      end
  end

end
