require 'test_helper'

class QuestionnairesControllerTest < ActionController::TestCase
  setup do
    @questionnaire = questionnaires(:max)   
    @user = users(:john)
    login_as(:john)
  end

  test "should get index for current user" do
    get :index
    
    assert_response :success
    assert_not_nil assigns(:questionnaires)
    assert_equal 2, assigns(:questionnaires).length
    assert assigns(:questionnaires).all {|q| q.user == @user}
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create questionnaire" do
    assert_difference('Questionnaire.count') do
      post :create, questionnaire: { as_pain: @questionnaire.as_pain, fatigue: @questionnaire.fatigue, localized_discomfort: @questionnaire.localized_discomfort, 
                                     medication: @questionnaire.medication, medication_effectiveness: @questionnaire.medication_effectiveness, 
                                     morning_stiffness: @questionnaire.morning_stiffness, other_pain: @questionnaire.other_pain, 
                                     wakeup_discomfort: @questionnaire.wakeup_discomfort }
    end

    assert_redirected_to questionnaire_path(assigns(:questionnaire))
    assert_equal @user, assigns(:questionnaire).user
  end

  test "should show questionnaire for current user" do
    get :show, id: @questionnaire
    
    assert_response :success
    assert_equal @user, assigns(:questionnaire).user
  end

  test "should not show questionnaire for other user" do
    login_as(:jane)
    get :show, id: @questionnaire
    
    assert_response 403
  end

  test "should get edit for current user" do
    get :edit, id: @questionnaire
    
    assert_response :success
    assert_equal @user, assigns(:questionnaire).user
  end

  test "should not get edit for other user" do
    login_as(:jane)
    
    get :edit, id: @questionnaire
    
    assert_response 403
  end

  test "should update questionnaire for current user" do
    put :update, id: @questionnaire, questionnaire: { as_pain: 3, fatigue: 3, localized_discomfort: 3, medication: "No Medications", medication_effectiveness: 3, 
                                                      morning_stiffness: 3, other_pain: 3, wakeup_discomfort: 3 }
    assert_redirected_to questionnaire_path(assigns(:questionnaire))
    q = assigns(:questionnaire)
    assert_equal [3, 3, 3, 3, 3, 3, 3, "No Medications"], [q.as_pain, q.fatigue, q.localized_discomfort, q.medication_effectiveness, q.morning_stiffness, 
                                                            q.other_pain, q.wakeup_discomfort, q.medication]
  end
  
  test "should not be able to update user on questionnaire" do
    assert_raises ActiveModel::MassAssignmentSecurity::Error do
      put :update, id: @questionnaire, questionnaire: { user_id: 2 } 
    end
  end

  test "should not update questionnaire for other user" do
    login_as(:jane)
    put :update, id: @questionnaire, questionnaire: { as_pain: 3, fatigue: 3, localized_discomfort: 3, medication: "No Medications", medication_effectiveness: 3, 
                                                      morning_stiffness: 3, other_pain: 3, wakeup_discomfort: 3 }
    
    q = assigns(:questionnaire)
    
    assert_equal @questionnaire, q                                                      
    assert_response 403
  end

  test "should destroy questionnaire for current user" do
    assert_difference('Questionnaire.count', -1) do
      delete :destroy, id: @questionnaire
    end

    assert_redirected_to questionnaires_path
  end
  
  test "should not destroy questionnaire for other user" do
    login_as(:jane)
        
    assert_no_difference('Questionnaire.count') do
      delete :destroy, id: @questionnaire
    end
    
    assert_response 403
  end
end
