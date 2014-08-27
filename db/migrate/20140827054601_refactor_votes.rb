class RefactorVotes < ActiveRecord::Migration

  def change
    change_table :votes do |t|
      t.remove :user_id
      t.remove :game_id
      t.remove :pick
      t.references :contestant, :index => true
      t.references :game, :index => true
      t.references :team, :index => true
    end
  end
end
