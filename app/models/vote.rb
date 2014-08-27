class Vote < ActiveRecord::Base
  belongs_to :contestant
  belongs_to :game
  belongs_to :team

  # Ensure each contestant can only vote for a team once per game
  validates :team_id, uniqueness: { scope: [:game_id, :contestant_id] }
end
