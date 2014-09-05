class Admin::ContestantsController < AdminController
  before_action :set_contestant, only: [:show, :update, :destroy]
  before_action :set_admin_week, only: [:show, :update, :destroy]

  # GET /admin/contestants
  def index
    @contestants = Contestant.paginate(:page => params[:page], :per_page => 35).order(:email => :asc)
  end

  # GET /admin/contestants/1
  def show
  end

  # GET /admin/contestants/new
  def new
    @contestant = Contestant.new
  end

  # POST /admin/contestants
  def create
    @contestant = Contestant.new(contestant_params)
    if @contestant.save
      redirect_to admin_contestants_path, notice: "Contestant '#{@contestant.name}' was successfully created."
    else
      render :new
    end
  end

  # DELETE /admin/contestants/1
  def destroy
    @contestant.destroy
    redirect_to admin_contestants_url, notice: 'Contestant was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contestant
      @contestant = Contestant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contestant_params
      params.require(:contestant).permit(:name)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_admin_week
      @week = Week.current_or_number(nil)
    end
end
