class Week < ActiveRecord::Base
  belongs_to :previous_week,      :class_name => "Week"
  belongs_to :next_week,          :class_name => "Week"
  belongs_to :tiebreaker_game,    :class_name => "Game"
  belongs_to :winning_contestant, :class_name => "Contestant"

  has_many :games

  validates :number, presence: true, uniqueness: true

  after_touch :set_tiebreaker_game

  def regular_games
    games.where.not(:id => tiebreaker_game_id)
  end

  def set_tiebreaker_game
    self.tiebreaker_game = games.order(:order => :asc).last
    save
  end

  def self.current_or_number(week_number)
    if week_number.blank?
      where(:status => true).first
    else
      where(:number => week_number).first
    end
  end
end
