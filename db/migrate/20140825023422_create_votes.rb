class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :game_id
      t.string :pick

      t.timestamps
    end
  end
end
