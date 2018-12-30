class SessionsController < ApplicationController
  def new
  end

	def create
		user = User.where("user_name = ? or email = ?", params[:name], params[:name]).first
		if user 
			session[:user_id] = user.id
			redirect_to root_url, notice: "Successfully Logged in!"
		else
			flash.now[:alert] = "Email or password is invalid"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, notice: "Logged out Successfully!"
	end
end