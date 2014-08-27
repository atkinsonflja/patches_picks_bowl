class PlayController < ApplicationController
  before_action :set_week, only: [:index, :vote]
  before_action :authenticate_contestant!

  # GET /play
  def index
    @votes = current_contestant.votes_for(@week)
  end

  # POST /play/vote
  def vote
    params[:games].each do |game_id, team_id|
      vote = current_contestant.votes.find_or_initialize_by(:game_id => game_id)
      vote.team_id = team_id
      vote.save
    end
    @tiebreaker.update_attributes(tiebreaker_params)

    redirect_to play_path, notice: "Your votes have been cast!"
  end

  private

  def set_week
    @week = Week.current_or_number(params[:week])
    @tiebreaker = current_contestant.tiebreakers.where(:game => @week.tiebreaker_game).first_or_initialize
    redirect_to(root_path, notice: "Couldn't find any weeks!") if @week.nil?
  end

  def tiebreaker_params
    params[:tiebreaker].permit(:home_score, :away_score)
  end
end
