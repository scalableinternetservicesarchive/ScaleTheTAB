class UserOrderHistorysController < ApplicationController
  def show
		if user_signed_in?
			@checkouts = Checkout.where(user_id: current_user.id)
			fresh_when(:etag => @checkouts)
		end  
	end
end
