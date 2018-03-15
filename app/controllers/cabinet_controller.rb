class CabinetController < ApplicationController
  
  require "orderlist"
  
  def view

	@list = OrderList.getlist
	
  end
  
end
