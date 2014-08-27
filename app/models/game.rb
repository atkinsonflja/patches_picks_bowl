class Game < ActiveRecord::Base
  belongs_to :week, touch: true
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"
  belongs_to :winning_team, class_name: "Team"

  validates :week_id, :home_team_id, :away_team_id, :presence => true
end
