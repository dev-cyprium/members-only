class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #TODO: Sessions and cookies not working, continue from part 9 from the assigment

  helper_method :logged_in?
  helper_method :get_title
  helper_method :current_user

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

  def logged_in?
    session[:user_id]
  end

  def get_title(post)
    if logged_in?
      "#{post.user.name} said: "
    else
      "User said: "
    end
  end

  private
  	def search_db_for token
  		User.find_by(remember_token: token)
  	end
end
