class Questionnaire < ActiveRecord::Base
  attr_accessible :age, :as_pain, :fatigue, :gender, :localized_discomfort, :medication, :medication_effectiveness, :morning_stiffness, :other_pain, :wakeup_discomfort
end
