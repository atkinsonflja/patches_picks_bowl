class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.integer :number
      t.boolean :status
      t.string :winner
      t.integer :previous_week_id

      t.timestamps
    end
  end
end
