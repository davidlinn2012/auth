class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  private

  def current_user
  	@current_user || User.find_by_name(session[:user_name]) if session[:user_name]
  end

  def require_login
  	unless current_user
		flash[:error] = "Please login to post"
		redirect_to login_path
	end
  end

end
