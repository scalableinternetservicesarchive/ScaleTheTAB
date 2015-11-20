module CurrentTab
  extend ActiveSupport::Concern

  private
  
    def set_tab
      @tab = Tab.find(session[:tab_id])
    rescue ActiveRecord::RecordNotFound      
      @tab = Tab.create({user_id: current_user.id, table_id: params[:table_id]})
      session[:tab_id] = @tab.id
    end
end
