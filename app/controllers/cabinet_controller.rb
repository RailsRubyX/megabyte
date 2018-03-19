class CabinetController < ApplicationController
  
  require "orderlist"
  
  def view
  	
 	if user_signed_in?
 		#byebug
		@list = OrderList.getlist(current_user.id)
	else
		redirect_to new_user_session_path
	end
	
  end
  
end
