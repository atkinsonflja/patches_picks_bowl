class AddVoteCountToContestants < ActiveRecord::Migration
  def change
    add_column :contestants, :votes_count, :integer, :default => 0, :nil => false, :index => true
  end
end
