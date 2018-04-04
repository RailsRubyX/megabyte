class PricesController < ApplicationController
	before_action :find_price, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@prices = Price.all.order('created_at DESC')
	end
	
	def new
		if current_user.id == 1
			@price = Price.new
		else
			redirect_to root_path
		end		
	end

	def create
		if current_user.id == 1
			@price = Price.new(price_params)
		else
			rredirect_to root_path
		end	

		if @price.save
			redirect_to @price, notice: "Успешно создана группа прайслиста"
		else 
			render 'new'
		end	
	end	

	def show
	end

	def edit
	end
	
	def update
		if @price.update(price_params)
			redirect_to @price
		else
			render 'edit'
		end		
	end

	def destroy
		@price.destroy
		redirect_to prices_path, notice: "Группа прайс-листа успешно удалена"
	end	

private
	def price_params
		params.require(:price).permit(:title, pricelists_attributes: [:id, :name, :value, :_destroy])
	end	

	def find_price
		@price = Price.find(params[:id])
	end	
end
