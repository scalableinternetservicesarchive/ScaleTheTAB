module ApplicationHelper
	def page_header(text)
		content_for(:page_header) { text.to_s }
	end

	# def gravatar_for(user, size = 30, title = user.name)
	# 	image_tag gravatar_image_url(user.email, size: size), title: title, class: 'img-rounded'
	# end

	def sendmsg(owner_id, msg)
  		recipients = User.where(id: owner_id)
   	    conversation = current_user.send_message(recipients, msg , "Order").conversation
        flash[:success] = "Message has been sent!"
  	end
end
