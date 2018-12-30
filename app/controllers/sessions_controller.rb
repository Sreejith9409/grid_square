class SessionsController < ApplicationController

	def create
		user = User.where("user_name = ? or email = ?", params[:name], params[:name]).first
		if user 
			session[:user_id] = user.id
			redirect_to root_url, notice: "Successfully Logged in!"
		else
			flash.now[:alert] = "UserName or Email is invalid"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, notice: "Logged out Successfully!"
	end
end
