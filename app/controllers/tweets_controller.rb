class TweetsController < ApplicationController
	before_filter :require_login

	def create
		tweet = current_user.tweets.build(params[:tweet])
		if tweet.save
			flash[:notice] = "Tweet saved"
			redirect_to user_name_path(current_user.name)
		else
			flash[:notice] = "Unable to save tweet"
			redirect_to user_name_path(current_user.name)
		end
	end
end
