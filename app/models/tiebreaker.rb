class Tiebreaker < ActiveRecord::Base
  belongs_to :contestant
  belongs_to :game

  validates :game_id, uniqueness: { scope: [:contestant_id] }
end
