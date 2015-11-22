module CurrentTab
  extend ActiveSupport::Concern

  private
  
    def set_tab
      @tab = Tab.find(session[:tab_id])
    rescue ActiveRecord::RecordNotFound
      @user_id = current_user.id if user_signed_in? else 1
      @tab = Tab.create({user_id: @user_id, table_id: params[:table_id]})
      session[:tab_id] = @tab.id
    end
end
