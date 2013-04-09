class HomeController < ApplicationController
  skip_before_filter :authorize
  
  def index
    @logged_in = logged_in?
  end
end
