class Admin::GamesController < AdminController
  before_action :set_week
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /admin/weeks/1/games
  def index
    redirect_to admin_week_url(@week)
  end

  # GET /admin/weeks/1/games/1
  def show
    redirect_to edit_admin_week_game_url(@week, @game)
  end

  # GET /admin/weeks/1/games/new
  def new
    @game = Game.new
  end

  # GET /admin/weeks/1/games/1/edit
  def edit
  end

  # POST /admin/weeks/1/games
  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to admin_week_url(@week), notice: 'Game was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/weeks/1/games/1
  def update
    if @game.update(game_params)
      redirect_to admin_week_url(@week), notice: 'Game was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/weeks/1/games/1
  def destroy
    @game.destroy
    redirect_to admin_week_url(@week), notice: 'Game was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_week
      @week = Week.find(params[:week_id])
    end

    def set_game
      @game = @week.games.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:week_id, :home_team_id, :home_team_ttalk, :away_team_id, :away_team_ttalk, :order)
    end
end
