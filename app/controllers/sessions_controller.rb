class SessionsController < ApplicationController

	# POST /sessions
  # POST /sessions.json
	def create
		# User can login either with username or email
    user = User.where(remote_ip: session[:remote_ip]).last
    user = User.generate_new_user(session[:remote_ip])
		if user 
			#If valid user then session is started
			session[:user_id] = user.id
			redirect_to root_url, notice: "Successfully Logged in!"
		end
	end

	def destroy
		# Logout User
		session[:user_id] = nil
		redirect_to root_url, notice: "Logged out Successfully!"
	end
end
