module CurrentCart
  extend ActiveSupport::Concern

	include CurrentTab

  private

    def set_cart 
      @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
			@tab = set_tab
      @cart = Cart.create({round_number: @tab.carts.length+1})
      session[:cart_id] = @cart.id
			@cart
    end
end
