class Contestant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :votes
  has_many :tiebreakers

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

  def self.top_voters(max = 20)
    order(:votes_count => :desc).limit(max)
  end

  def self.top_scorers(max = 20)
    order(:score => :desc).limit(max)
  end

  def solve_top_scorers!
    Contestant.all.each do |contestant|
      contestant.compute_score
    end
  end

  # TODO: Add name fields to the sign up form and use that here instead of the email address
  def display_name
    email.split("@").first.titleize # temp, instead of First Name, Last initial
  end

  def is_admin?
    tsbadmin = [ "john@ceaproduction.com", "Gwatdesigns@gmail.com", "Katie@taxslayerbowl.com" ]
    tsbadmin.include?(email)
  end
end
