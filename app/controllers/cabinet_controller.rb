class CabinetController < ApplicationController
  
  require "orderlist"
  
  def view
  	
 	if user_signed_in?
		@list = OrderList.getlist
	else
		redirect_to new_user_session_path
	end
	
  end
  
end
