class Contestant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :votes

  # Returns a hash of ids that looks like:
  #
  # {
  #   GAME_1 => TEAM_1,
  #   GAME_2 => TEAM_3
  # }
  #
  # There's some n+1 queries that will happen in the views loading like this,
  # but since there's a limited number of games per week, we aren't that worried
  # unless it becomes a performance problem (unlikely?)
  def votes_for(week)
    votes.where(:game_id => week.game_ids).map { |v| [v.game_id, v.team_id] }.to_h
  end
end
