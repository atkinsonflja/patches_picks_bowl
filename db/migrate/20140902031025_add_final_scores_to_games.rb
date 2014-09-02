class AddFinalScoresToGames < ActiveRecord::Migration
  def change
    add_column :games, :home_score, :integer, :null => false, :default => 0
    add_column :games, :away_score, :integer, :null => false, :default => 0
  end
end
