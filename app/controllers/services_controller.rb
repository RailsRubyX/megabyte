class ServicesController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	
	def index
		@services = Service.all.order('created_at DESC')
	end

	def new
		if current_user.id == 1
			@service = current_user.services.build
		else
			redirect_to root_path
		end		
	end


	def create
		if current_user.id == 1
			@service = current_user.services.build(service_params)
		else
			redirect_to root_path
		end	
		
		if @service.save
			redirect_to @service
		else
			render 'new'	
		end	
	end

	def show
		@services = Service.all.order('created_at DESC')
		@service = Service.find(params[:id])
	end	


	def edit
		if current_user.id == 1
			@service = Service.find(params[:id])
		else
			redirect_to root_path
		end			
	end	


	def update
		@service = Service.find(params[:id])

		if @service.update(params[:service].permit(:title, :body, :imageurl))
			redirect_to @service
		else
			render 'edit'
		end	
	end	

	def destroy
		@service = Service.find(params[:id])
		@service.destroy

		redirect_to root_path
	end	

	private
		def service_params	
			params.require(:service).permit(:title, :body, :imageurl)
		end	
		
end
