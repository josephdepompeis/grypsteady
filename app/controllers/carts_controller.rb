class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  # GET /carts.json
  def index
    # @carts = Cart.all
    # @cart = Cart.where(user_id: session[:user_id]).first
    # byebug

    if session[:user_id] != nil
      @cart = Cart.where(user_id: session[:user_id]).first
    else
      @cart = Cart.where(id: session[:cart_id]).first
    end



      @amount = @cart.calculate_price_based_on_qty

      @size_options = [['Small', 1], ['Medium', 2],
      ['Large', 3], ['Extra Large', 4]]


      @color_options = [['Red', 1], ['Yellow', 2],
      ['Blue', 3], ['Green', 4]]

  end


  # GET /carts/1
  # GET /carts/1.json
  def show
    @cart.destroy_cart_items

  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    def check_user
      if session[:user_id] == nil
        redirect_to login_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      # params.fetch(:cart, {})
      params.require(:cart).permit(:user_id)
    end
end
