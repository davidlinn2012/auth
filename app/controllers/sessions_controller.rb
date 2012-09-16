class SessionsController < ApplicationController
	def new
	end
	
	def create
		user = User.authenticate(params[:name], params[:password])
		if user
			session[:user_id] = user.name
			flash[:notice] = "Welcome #{user.name}"
			redirect_to users_index_path
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
