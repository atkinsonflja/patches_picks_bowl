class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :week_id
      t.integer :home_team_id
      t.string :home_team_ttalk
      t.integer :away_team_id
      t.string :away_team_ttalk
      t.integer :order

      t.timestamps
    end
  end
end
