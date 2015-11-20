module CurrentTab
  extend ActiveSupport::Concern

  private
  
    def set_tab
      @tab = Tab.find(session[:tab_id])
    rescue ActiveRecord::RecordNotFound      
      @tab = Tab.create({user_id: 1})
      session[:tab_id] = @tab.id
    end
end
