require 'test_helper'

class QuestionnaireMailerTest < ActionMailer::TestCase
  test "questionnaire_filled_out" do
    mail = QuestionnaireMailer.questionnaire_filled_out
    assert_equal "Questionnaire filled out", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "questionnaire_is_due" do
    mail = QuestionnaireMailer.questionnaire_is_due
    assert_equal "Questionnaire is due", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
