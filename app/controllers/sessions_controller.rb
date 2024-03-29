class SessionsController < ApplicationController
  skip_before_filter :authorize
  
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
      login_user(user)
      redirect_to root_url
    else
      redirect_to login_url, alert: "Invalid user or password. Please try again"
    end
  end

  def destroy
    logout_user
    redirect_to root_url, notice: 'Logged out'
  end
end
