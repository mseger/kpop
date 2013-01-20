class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_request_environment

private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def fb_graph
    @fb_graph ||= current_user.fb_graph if current_user
  end

  def set_request_environment
    User.current = current_user
  end

  helper_method :current_user, :fb_graph
end
