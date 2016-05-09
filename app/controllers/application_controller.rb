class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #TODO: Sessions and cookies not working, continue from part 9 from the assigment

  def sign_in(user)
  	session[:user_id] = user.id
  	token = User.generate_token
  	user.update_attribute(:remember_token, token)
  	cookies.permanent[:remember_token] = token
  	current_user = user
  end

  def current_user
  	@current_user ||= search_db_for(cookies[:remember_token])
  end

  def current_user=(user)
  	@current_user = user
  end

  
  def logout(user)
    session[:user_id] = nil
    cookies[:remember_token] = nil
  end

  private
  	def search_db_for token
  		User.find_by(remember_token: token)
  	end
end
