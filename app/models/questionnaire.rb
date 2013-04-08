class Questionnaire < ActiveRecord::Base
  attr_accessible :age, :as_pain, :fatigue, :gender, :localized_discomfort, :medication, :medication_effectiveness, :morning_stiffness, :other_pain, :wakeup_discomfort
  validates_numericality_of :age, greater_than_or_equal_to: 0
  validates_numericality_of :medication_effectiveness, greater_than: 0, less_than: 11, allow_nil: true
  validates_numericality_of :as_pain, :fatigue, :gender, :localized_discomfort, :morning_stiffness, :other_pain, :wakeup_discomfort, greater_than: 0, less_than: 11 
end
