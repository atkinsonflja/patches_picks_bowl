class Admin::WeeksController < AdminController
  before_action :set_admin_week, only: [:show, :edit, :update, :destroy]

  # GET /admin/weeks
  # GET /admin/weeks.json
  def index
    @weeks = Week.all
  end

  # GET /admin/weeks/1
  def show
  end

  # GET /admin/weeks/new
  def new
    @week = Week.new
  end

  # GET /admin/weeks/1/edit
  def edit
  end

  # POST /admin/weeks
  def create
    @week = Week.new(week_params)
    if @week.save
      redirect_to [:admin, @week], notice: 'Week was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/weeks/1
  def update
    if @week.update(week_params)
      redirect_to [:admin, @week], notice: 'Week was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/weeks/1
  def destroy
    @week.destroy
    redirect_to admin_weeks_url, notice: 'Week was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_week
      @week = Week.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def week_params
      params[:week].permit(:number, :status, :winning_contestant_id, :previous_week_id, :next_week_id)
    end
end
