class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@posts = Post.all.order('created_at DESC')
		@mainpage = true
	end


	def new
		if current_user.id == 1
			@post = current_user.posts.build
		else
			redirect_to root_path
		end		
	end


	def create
		if current_user.id == 1
			@post = current_user.posts.build(post_params)
		else
			redirect_to root_path
		end	
		
		if @post.save
			redirect_to @post
		else
			render 'new'	
		end	
	end

	def show
		@post = Post.find(params[:id])
	end	


	def edit
		if current_user.id == 1
			@post = Post.find(params[:id])
		else
			redirect_to root_path
		end			
	end	


	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :body, :image))
			redirect_to @post
		else
			render 'edit'
		end	
	end	

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to root_path
	end	

	private
		def post_params	
			params.require(:post).permit(:title, :body, :image)
		end	
end
