class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :questionnaires, :users, :name => "questionnaires_user_id_fk"
    add_index :questionnaires, :user_id
  end
end
