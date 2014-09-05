class Week < ActiveRecord::Base
  belongs_to :previous_week,      :class_name => "Week"
  belongs_to :next_week,          :class_name => "Week"
  belongs_to :tiebreaker_game,    :class_name => "Game"
  belongs_to :winning_contestant, :class_name => "Contestant"

  has_many :games

  validates :number, presence: true, uniqueness: true

  after_touch :set_tiebreaker_game

  def self.statusoff(date)
    if date == "2014-09-05"
      @current_week.status = 0
    end
  end

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

  def solve_winner!
    winners = []
    best = 0

    Contestant.all.each do |contestant|
      current = 0
      games.all.each do |game|
        if game == tiebreaker_game
          tiebreaker = contestant.tiebreakers.where(game: game).first
          if tiebreaker && game.winning_team == game.home_team && tiebreaker.home_score > tiebreaker.away_score
            current += 1
          end
        else
          vote = contestant.votes.where(game: game).first
          if vote && vote.team == game.winning_team
            current += 1
          end
        end
      end

      if current > best
        winners = [contestant]
        best = current
      elsif current == best
        winners << contestant
      end
    end

    if winners.size > 1
      tie_winners = []
      lowest_diff = 1000000000 # Ridiculous number
      winners.each do |contestant|
        tiebreaker = contestant.tiebreakers.where(game: tiebreaker_game).first
        if tiebreaker
          home = (tiebreaker.home_score - tiebreaker_game.home_score).abs
          away = (tiebreaker.away_score - tiebreaker_game.away_score).abs
          diff = home + away
          if diff < lowest_diff
            tie_winners = [contestant]
            lowest_diff = diff
          elsif diff == lowest_diff
            tie_winners << contestant
          end
        end
      end
      winners = tie_winners unless tie_winners.empty?
    end

    update_attribute(:winning_contestant, winners.sample)
  end
end
