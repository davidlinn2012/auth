class SessionsController < ApplicationController
	def new
	end
	
	def create
		@user = User.authenticate(params[:name], params[:password])
		if @user
			session[:user_name] = @user.name
			flash[:notice] = "Welcome #{@user.name}"
			redirect_to user_name_path(@user.name)
		else
			flash[:notice] = "Invalid username password combo"
			render 'new'
		end
	end
	
	def destroy
		session[:user_name] = nil
		flash[:notice] = "Logged out"
		redirect_to root_url
	end
end
