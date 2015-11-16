class CartsController < ApplicationController
  include CurrentTab
  before_action :set_tab, only: [:add_to_order, :create]
  before_action :set_cart, only: [:show, :edit, :update, :destroy, :add_to_order]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new(round_number: '2')
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new
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
    if not @cart.line_items.empty?
      @cart.destroy if @cart.id == session[:cart_id]
      session[:cart_id] = nil
    end
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Cart was successfully destroyed.' }
      format.js
      format.json { head :no_content }
    end
  end

  def add_to_order

	#send message to kitchen

    @tab.carts << @cart
    puts "***************************************"
    puts @cart.inspect
    puts "***************************************"
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to @cart.line_items[0].item.menu.restaurant }
      format.js
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params[:cart]
    end
end
