class Admin::TeamsController < AdminController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /admin/teams
  def index
    @teams = Team.paginate(:page => params[:page], :per_page => 30).order(:name => :asc)
  end

  # GET /admin/teams/1
  def show
    redirect_to edit_admin_team_path(@team)
  end

  # GET /admin/teams/new
  def new
    @team = Team.new
  end

  # GET /admin/teams/1/edit
  def edit
  end

  # POST /admin/teams
  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to admin_teams_path, notice: "Team '#{@team.name}' was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /admin/teams/1
  def update
    if @team.update(team_params)
      redirect_to edit_admin_team_path(@team), notice: 'Team was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/teams/1
  def destroy
    @team.destroy
    redirect_to admin_teams_url, notice: 'Team was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name)
    end
end
