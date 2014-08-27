class RefactorTiebreakers < ActiveRecord::Migration
  def change
    change_table :tiebreakers do |t|
      t.remove :user_id
      t.references :winning_contestant
    end

    change_table :weeks do |t|
      t.remove :winner
      t.references :winning_contestant
      t.references :tiebreaker_game
    end

    change_table :games do |t|
      t.references :winning_team
    end
  end
end
