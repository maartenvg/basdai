class Questionnaire < ActiveRecord::Base
  attr_accessible :age, :as_pain, :fatigue, :gender, :localized_discomfort, :medication, :medication_effectiveness, :morning_stiffness, :other_pain, :wakeup_discomfort
  validates_inclusion_of :gender, in: ['m', 'f']
  validates_numericality_of :age, greater_than_or_equal_to: 0, only_integer: true
  validates_inclusion_of :medication_effectiveness, in: 1..10, allow_nil: true
  validates_inclusion_of :as_pain, :fatigue, :localized_discomfort, :other_pain, :wakeup_discomfort, in: 1..10
  validates_inclusion_of :morning_stiffness, in: 0..10
end
