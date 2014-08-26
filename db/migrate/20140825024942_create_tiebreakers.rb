class CreateTiebreakers < ActiveRecord::Migration
  def change
    create_table :tiebreakers do |t|
      t.integer :user_id
      t.integer :home_score
      t.integer :away_score
      t.integer :game_id

      t.timestamps
    end
  end
end
