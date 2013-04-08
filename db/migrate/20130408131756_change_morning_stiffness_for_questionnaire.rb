class ChangeMorningStiffnessForQuestionnaire < ActiveRecord::Migration
  def up
    change_column :questionnaires, :morning_stiffness, :integer
  end

  def down
    change_column :questionnaires, :morning_stiffness, :decimal
  end
end
