class Admin::TiebreakersController < AdminController
  before_action :set_tiebreaker, only: [:show, :edit, :update, :destroy]

  # GET /tiebreakers
  # GET /tiebreakers.json
  def index
    @tiebreakers = Tiebreaker.all
  end

  # GET /tiebreakers/1
  # GET /tiebreakers/1.json
  def show
  end

  # GET /tiebreakers/new
  def new
    @tiebreaker = Tiebreaker.new
  end

  # GET /tiebreakers/1/edit
  def edit
  end

  # POST /tiebreakers
  # POST /tiebreakers.json
  def create
    @tiebreaker = Tiebreaker.new(tiebreaker_params)

    respond_to do |format|
      if @tiebreaker.save
        format.html { redirect_to @tiebreaker, notice: 'Tiebreaker was successfully created.' }
        format.json { render :show, status: :created, location: @tiebreaker }
      else
        format.html { render :new }
        format.json { render json: @tiebreaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tiebreakers/1
  # PATCH/PUT /tiebreakers/1.json
  def update
    respond_to do |format|
      if @tiebreaker.update(tiebreaker_params)
        format.html { redirect_to @tiebreaker, notice: 'Tiebreaker was successfully updated.' }
        format.json { render :show, status: :ok, location: @tiebreaker }
      else
        format.html { render :edit }
        format.json { render json: @tiebreaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tiebreakers/1
  # DELETE /tiebreakers/1.json
  def destroy
    @tiebreaker.destroy
    respond_to do |format|
      format.html { redirect_to tiebreakers_url, notice: 'Tiebreaker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tiebreaker
      @tiebreaker = Tiebreaker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tiebreaker_params
      params.require(:tiebreaker).permit(:user_id, :home_score, :away_score, :game_id)
    end
end
