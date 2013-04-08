class Questionnaire < ActiveRecord::Base
  attr_accessible :as_pain, :fatigue, :localized_discomfort, :medication, :medication_effectiveness, :morning_stiffness, :other_pain, :wakeup_discomfort
  validates_inclusion_of :medication_effectiveness, in: 1..10, allow_nil: true
  validates_inclusion_of :as_pain, :fatigue, :localized_discomfort, :other_pain, :wakeup_discomfort, in: 1..10
  validates_inclusion_of :morning_stiffness, in: 0..10
  def to_s
    "Questionnaire no. #{@id}"
  end

  def score
    overall = fatigue + as_pain + other_pain + localized_discomfort;
    mornings = wakeup_discomfort + morning_stiffness;
    (overall + ( mornings / 2 ) ) * 0.2;
  end
end
