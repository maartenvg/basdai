class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authorize
  
  
  private
  
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end
  
  def active_user?
    !session[:user_id].nil?
  end
  
  def active_user
    User.find_by_id(session[:user_id])
  end
  
  def login_user (user)
    session[:user_id] = user.id
  end
end
