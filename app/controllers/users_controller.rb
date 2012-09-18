class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def index
		@users = User.all
	end

	def create
	 	@user = User.new(params[:user])
	 	if @user.save
	 		flash[:notice] = "User successfully created"
			render 'show'
	 	else
	 		flash[:notice] = "Error creating user"
	 		render 'new'
	 	end
	end

	def show
		@user = User.find_by_name(params[:name])
	end
end
