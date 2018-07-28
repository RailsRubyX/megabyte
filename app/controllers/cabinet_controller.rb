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

  def show_order
    #byebug
    @details_u = OrderList.getdetails_usl(params[:cabinet_id])
    @details_t = OrderList.getdetails_tov(params[:cabinet_id])
  	#byebug
  	respond_to do |format|
  		format.js
  	end
  end

  def show
    respond_to do |format|
      format.js
    end
  end
  
end
