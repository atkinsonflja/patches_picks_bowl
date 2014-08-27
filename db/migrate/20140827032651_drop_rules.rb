class DropRules < ActiveRecord::Migration

  def up
    drop_table :rules
  end

  def down
    create_table :rules do |t|
      t.timestamps
    end
  end
end
