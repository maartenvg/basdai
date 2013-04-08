class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.date   :birthdate
      t.string :gender
      t.timestamps
    end
    remove_column :questionnaires, :gender
    remove_column :questionnaires, :age
  end

  def down
    drop_table :users
    add_column :questionnaires, :gender, :string
    add_column :questionnaires, :age, :integer
  end
end
