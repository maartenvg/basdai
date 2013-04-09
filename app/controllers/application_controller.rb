class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authorize
  
  
  private
  
  def authorize
    unless logged_in?
      redirect_to login_url, notice: "Please log in"
    end
  end
  
  def logged_in?
    !!current_user
  end
  
  def current_user
    @current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
  end
  
  def login_user(user)
    @current_user = user
    session[:user_id] = user.id
  end
  
  def logout_user
    @current_user = session[:user_id] = nil
  end
end
