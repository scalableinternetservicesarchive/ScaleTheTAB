class RestaurantsController < ApplicationController
  include CurrentCart
  include CurrentTab
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_owner!, except: [ :index, :show ]

  # GET /restaurants
  # GET /restaurants.json
  def index

    if params[:search_name] or params[:search_city] or params[:search_zip_code]
      if not params[:search_name]
        search_name_field = '%'
      else
        search_name_field = params[:search_name]
      end
      if not params[:search_city]
        search_city_field = '%'
      else
        search_city_field = params[:search_city]
      end
      if not params[:search_zip_code]
        search_zip_code_field = '%'
      else
        search_zip_code_field = params[:search_zip_code]
      end
      @restaurants = Restaurant.search(search_name_field, search_city_field, search_zip_code_field).paginate(page: params[:page], per_page: 6)
    else
      if owner_signed_in?
        @restaurants = Restaurant.where("owner_id = ?", current_owner.id).paginate(page: params[:page], per_page: 6)
      else
        @restaurants = Restaurant.all.paginate(page: params[:page], per_page: 6)
      end
    end
    
    #Client Side Caching using etag
    fresh_when(:etag => [@restaurants, current_owner, current_user])

  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @restaurant = Restaurant.find(params[:id])
    if params[:table_id]
    @set_tableid = true
  else
    @set_tableid = false
  end
    @menus = @restaurant.menus
    
    @items = []
    @menus.each do |m|
      @items << m.items
    end
    

    @tables = @restaurant.tables
    @table_id = params[:table_id]

    # expires_in 0.5.minutes
    #Client side Caching using Etag

		fresh_when(:etag => [@restaurant, @menus, @items, @tables, params[:table_id]])

    # puts "*************************************"
    # puts @menus.last.updated_at.utc
    # puts @tables.inspect
    # fresh_when(:etag => [@restaurant.updated_at.utc, @menus.last.updated_at.utc])

		#create tab and cart if user is signed in or is in guest mode AND table_id is set
		if not owner_signed_in? and params[:table_id]
			@tab = set_tab
			@cart = set_cart
		end
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.owner_id = current_owner.id

    respond_to do |format|
      if @restaurant.save
         response.headers['id']=@restaurant.id.to_s
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :image, :description, :address, :city, :zip_code, :tell)
    end
end
