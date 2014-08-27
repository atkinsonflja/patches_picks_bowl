class FixOopsOnTiebreakers < ActiveRecord::Migration
  def change
    rename_column :tiebreakers, :winning_contestant_id, :contestant_id
  end
end
