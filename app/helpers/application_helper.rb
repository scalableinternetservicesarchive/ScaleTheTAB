module ApplicationHelper
	def page_header(text)
  		content_for(:page_header) { text.to_s }
	end

	def sendmsg(owner_id, msg)
  		recipients = Owner.where(id: owner_id)
  		puts "*********IN sendmsg**********"
  		# puts owner_id
  	  puts msg
  		puts recipients.inspect
  		# puts current_owner
      # if not user_signed_in?
      #   current_user = User.find(id: 1)
      # end
      puts "*** CURENT USER"
      puts current_user.inspect
   	  conversation = current_owner.send_message(recipients, msg , "Order").conversation
      flash[:success] = "Message has been sent!"
  	end
end
