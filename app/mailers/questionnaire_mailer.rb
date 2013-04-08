class QuestionnaireMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.questionnaire_mailer.questionnaire_filled_out.subject
  #
  def questionnaire_filled_out
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.questionnaire_mailer.questionnaire_is_due.subject
  #
  def questionnaire_is_due
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
