class AddUserToQuestionnaires < ActiveRecord::Migration
  def change
    add_column :questionnaires, :user_id, :integer
  end
end
