class SessionsController < ApplicationController
	def index
	end

	def new
		if !cookies[:remember_token].nil?
			user = current_user
			if !user.nil?
				sign_in user
				flash[:success] = "Login sucess (cookie)"
				redirect_to root_path
			end
		end
	end

	def create
		email = params[:session][:email]
		password = params[:session][:password]
		user = User.find_by(email: email)
		if user && user.authenticate(password)
			# Redirect to posts
			sign_in user
			flash[:success] = "Login sucess"
			redirect_to root_path
		else
			flash.now[:danger] = "Invalid login information"
			render 'new'
		end
	end

	def destroy
		logout current_user
		flash[:success] = "Logout success"
		redirect_to root_path
	end
end
