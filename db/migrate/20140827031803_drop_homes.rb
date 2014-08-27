class DropHomes < ActiveRecord::Migration

  def up
    drop_table :homes
  end

  def down
    create_table :homes do |t|
      t.timestamps
    end
  end
end
