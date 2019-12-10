class PagesController < ApplicationController

	def index
	end

	def mainpage
	end	
	
	def about
	end
		
	def contactus
		@name = params[:name]
		@surname = params[:surname]
		@email = params[:email]
		@phone = params[:phone]
		@msg = params[:msg]

		if @name != nil
			UserMailer.msg_email(@name, @surname, @email, @phone, @msg).deliver
		end	

		if @name == ""
			@error_msg = "Введите свое имя"
		end
	end

	def clients
	end
	
	def service
	end	
end
