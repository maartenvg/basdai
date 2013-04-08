class DropBasdaiFormsTable < ActiveRecord::Migration
  def up
    if ActiveRecord::Base.connection.table_exists? 'basdai_forms'
      drop_table :basdai_forms
    end
  end

  def down
    # no reverse, because :basdai_forms should never have existed
  end
end
