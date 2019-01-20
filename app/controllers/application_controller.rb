class ApplicationController < ActionController::Base
	helper_method :current_user
  protect_from_forgery with: :exception
  before_action :set_current_ip

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def set_current_ip
    session[:remote_ip] = request.env['REMOTE_ADDR']
  end
end
