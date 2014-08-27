class PlayController < ApplicationController
  before_action :set_week, only: [:index, :vote]
  before_action :authenticate_contestant!

  # GET /play
  def index
    @games = current_contestant.votes_for(@week)
  end

  # POST /play/vote
  def vote
    params[:games].each do |game_id, team_id|
      vote = current_contestant.votes.find_or_initialize_by(:game_id => game_id, :team_id => team_id)
      vote.save
    end
    redirect_to play_path, notice: "Your votes have been cast!"
  end

  private

  def set_week
    @week = Week.current_or_number(params[:week])
    redirect_to(root_path, notice: "Couldn't find any weeks!") if @week.nil?
  end
end
