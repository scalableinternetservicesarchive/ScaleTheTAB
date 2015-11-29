module ApplicationHelper
	def page_header(text)
  		content_for(:page_header) { text.to_s }
	end

	def sendmsg(owner_id, msg)
  		recipients = Owner.where(id: owner_id)
      puts "*********IN sendmsg***************************************************************"
      # puts owner_id
      # puts msg
      puts "Recipient: "
      puts recipients.inspect
      # puts current_owner
      puts "Current USer:"
      
      if not user_signed_in?
        puts "User has not signed in "
        temp = User.find(1)
        puts temp.inspect
      else
        temp = current_user
        puts current_user.inspect
        
      end
      conversation = temp.send_message(recipients, msg , "Order").conversation
      flash[:success] = "Message has been sent!"
    end
  	
end
