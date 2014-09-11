class AddScoreToContestants < ActiveRecord::Migration
  def change
    add_column :contestants, :score, :float, :default => 0, :nil => false, :index => true
  end
end
