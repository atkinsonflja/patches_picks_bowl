class Vote < ActiveRecord::Base
  belongs_to :contestant
  belongs_to :game
  belongs_to :team

  # Ensure each contestant can only vote for a team once per game
  validates_uniqueness_of :contestant_id, scope: [:game_id, :team_id]
end
