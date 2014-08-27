class Admin::GamesController < AdminController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /admin/games
  # GET /admin/games.json
  def index
    @games = Game.all.order(:order)
  end

  # GET /admin/games/1
  # GET /admin/games/1.json
  def show
  end

  # GET /admin/games/new
  def new
    @game = Game.new
  end

  # GET /admin/games/1/edit
  def edit
  end

  # POST /admin/games
  # POST /admin/games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to [:admin, @game], notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @game] }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/games/1
  # PATCH/PUT /admin/games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to [:admin, @game], notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @game] }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/games/1
  # DELETE /admin/games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to admin_games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:week_id, :home_team_id, :home_team_ttalk, :away_team_id, :away_team_ttalk, :order)
    end
end
