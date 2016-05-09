class PostsController < ApplicationController
	before_action :logged_user, only: [:new, :create]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		post = Post.new
		post.user_id = current_user.id
		post.content = user_params[:content]
		
		post.save
		redirect_to posts_path
	end

	private
		
		def user_params
			params.require(:post).permit(:content)
		end

		def logged_user
			if !logged_in?
					flash[:danger] = "You need to login to post!"
					redirect_to posts_path unless logged_in?
			end
		end
end
