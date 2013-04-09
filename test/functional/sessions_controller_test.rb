require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @user = users(:john)    
  end
  
  test "should get login form" do
    get :new
    assert_response :success
  end

  test "should login with correct password" do
    post :create, name: @user.name, password: 'secret'
    assert_redirected_to root_url
    assert_equal @user.id, session[:user_id]
  end

  test "should not login with wrong password" do
    post :create, name: @user.name, password: 'wrong'
    assert_redirected_to login_url
    assert_nil session[:user_id]
  end

  test "should not login with wrong name" do
    post :create, name: 'jane', password: 'secret'
    assert_redirected_to login_url
    assert_nil session[:user_id]
  end


  test "should logout" do
    login_as(:john)
    assert_not_nil session[:user_id]
    delete :destroy
    assert_nil session[:user_id]
    assert_redirected_to root_url
  end

end
