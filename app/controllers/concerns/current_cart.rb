module CurrentCart
  extend ActiveSupport::Concern

  private

    def set_cart 
      @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
			@tab = Tab.find(session[:tab_id])
      @cart = Cart.create({round_number: @tab.carts.length+1})
      session[:cart_id] = @cart.id
    end
end
