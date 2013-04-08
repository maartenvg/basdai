class HomeController < ApplicationController
  skip_before_filter :authorize
  
  def index
    @logged_in = active_user?
  end
end
