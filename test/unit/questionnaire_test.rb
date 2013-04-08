require 'test_helper'

class QuestionnaireTest < ActiveSupport::TestCase
  test "maximum score should be calculated right" do
    questionnaire = questionnaires(:max)
    assert_equal 10.0, questionnaire.score
  end
  
  test "score should be calculated right" do
    questionnaire = questionnaires(:range)
    assert_equal 3.1, questionnaire.score
  end
  
  test "minimum score should be calculated right" do
    questionnaire = questionnaires(:min)
    assert_equal 0.9, questionnaire.score
  end
end
