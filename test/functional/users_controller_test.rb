require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:john)
    login_as(:john)
  end

  test "should not get index" do
    get :index

    assert_redirected_to @user
  end

  test "should get new when not logged in" do
    logout
    get :new

    assert_response :success
  end

  test "should not get new when logged in" do
    get :new

    assert_redirected_to @user
  end

  test "should not create user when logged in" do
    assert_no_difference('User.count') do
      post :create, user: { email: @user.email, name: "#{@user.name}2", password: "test", password_confirmation: "test", gender: @user.gender, birthdate: @user.birthdate }
    end
    assert_redirected_to @user
  end

  test "should create user" do
    logout

    assert_difference('User.count') do
      post :create, user: { email: @user.email, name: "#{@user.name}2", password: "test", password_confirmation: "test", gender: @user.gender, birthdate: @user.birthdate }
    end

    assert_equal assigns(:user).id, session[:user_id]
    assert_redirected_to user_path(assigns(:user))
  end

  test "should show current user" do
    get :show, id: @user
    assert_response :success
  end

  test "should not show other user" do
    login_as(:jane)
    jane = users(:jane)
    get :show, id: @user

    assert_redirected_to jane
  end

  test "should get edit for current user" do
    get :edit, id: @user

    assert_response :success
  end

  test "should not get edit for other user" do
    login_as(:jane)
    jane = users(:jane)
    get :edit, id: @user

    assert_redirected_to edit_user_url(jane)
  end

  test "should update current user" do
    put :update, id: @user, user: { email: @user.email, name: @user.name, password: "test", password_confirmation: "test", gender: @user.gender, birthdate: @user.birthdate }

    assert_redirected_to @user
  end

  test "should not be able to update user id" do
    put :update, id: @user, user: { id: 12 }
    
    assert_equal @user.id, assigns(:current_user).id
  end

  test "should not be able to use existing name" do
    jane = users(:jane)
    put :update, id: @user, user: { name: jane.name }
  
    # succes means staying on the page
    assert_response :success
    assert_select 'div.field_with_errors label', 'Name' 
  end

  test "should not update other user" do
    login_as(:jane)
    put :update, id: @user, user: { email: @user.email, name: @user.name, password: "test", password_confirmation: "test", gender: @user.gender, birthdate: @user.birthdate }

    assert_response 403
  end

  test "should not be able to destroy users" do
    assert_raise ActionController::RoutingError do
       get :destroy
    end
  end
end
