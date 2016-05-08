class SessionsController < ApplicationController
	def index
	end

	def new
	end

	def create
		email = params[:session][:email]
		password = params[:session][:password]
		user = User.find_by(email: email)
		if user && user.authenticate(password)

		else
			flash.now[:danger] = "Invalid login information"
			render 'new'
		end
	end

end
