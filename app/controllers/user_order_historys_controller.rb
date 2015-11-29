class UserOrderHistorysController < ApplicationController
  def show
		if user_signed_in?		
			@tabs = Tab.where(user_id: current_user.id)	
		end  
	end
end
