class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.string :medication
      t.integer :medication_effectiveness
      t.integer :age
      t.string :gender
      t.integer :fatigue
      t.integer :as_pain
      t.integer :other_pain
      t.integer :localized_discomfort
      t.integer :wakeup_discomfort
      t.decimal :morning_stiffness

      t.timestamps
    end
  end
end
