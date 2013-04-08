require 'test_helper'

class QuestionnairesControllerTest < ActionController::TestCase
  setup do
    @questionnaire = questionnaires(:max)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questionnaires)
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
  end

  test "should show questionnaire" do
    get :show, id: @questionnaire
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @questionnaire
    assert_response :success
  end

  test "should update questionnaire" do
    put :update, id: @questionnaire, questionnaire: { as_pain: @questionnaire.as_pain, fatigue: @questionnaire.fatigue, localized_discomfort: @questionnaire.localized_discomfort, 
                                                      medication: @questionnaire.medication, medication_effectiveness: @questionnaire.medication_effectiveness, 
                                                      morning_stiffness: @questionnaire.morning_stiffness, other_pain: @questionnaire.other_pain, 
                                                      wakeup_discomfort: @questionnaire.wakeup_discomfort }
    assert_redirected_to questionnaire_path(assigns(:questionnaire))
  end

  test "should destroy questionnaire" do
    assert_difference('Questionnaire.count', -1) do
      delete :destroy, id: @questionnaire
    end

    assert_redirected_to questionnaires_path
  end
end
