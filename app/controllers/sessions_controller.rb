class SessionsController < ApplicationController

	# POST /sessions
  # POST /sessions.json
	def create
		# User can login either with username or email
		user = User.where("user_name = ? or email = ?", params[:name], params[:name]).first
		if user 
			#If valid user then session is started
			session[:user_id] = user.id
			redirect_to root_url, notice: "Successfully Logged in!"
		else
			#If in valid user then validation
			flash.now[:alert] = "UserName or Email is invalid"
			render "new"
		end
	end

	def destroy
		# Logout User
		session[:user_id] = nil
		redirect_to root_url, notice: "Logged out Successfully!"
	end
end
