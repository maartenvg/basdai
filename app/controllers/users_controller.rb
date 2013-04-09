class UsersController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]
  before_filter :not_logged_in, only: [:new, :create]
  
  # GET /users  
  def index
    redirect_to @current_user
  end
  
  # GET /users/1
  def show
    unless params[:id] == @current_user.id.to_s
      redirect_to @current_user  
    end
    
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    unless params[:id] == @current_user.id.to_s
      return redirect_to edit_user_url(@current_user)
    end
    
    @user = User.find(params[:id])
  end

  # POST /users
  def create
    @user = User.new(params[:user])

    saved = @user.save

    login_user(@user) if saved

    if saved
      redirect_to @user
    else
      render action: "new"
    end
  end

  # PUT /users/1
  def update
    @user = @current_user
    unless params[:id] == @current_user.id.to_s
      return render 'public/403', format: :html, status: 403
    end
    
    if @current_user.update_attributes(params[:user])
      redirect_to @current_user, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end
end
