class Admin::WeeksController < AdminController
  before_action :set_admin_week, only: [:show, :edit, :update, :destroy]

  # GET /admin/weeks
  # GET /admin/weeks.json
  def index
    @weeks = Week.all
  end

  # GET /admin/weeks/1
  # GET /admin/weeks/1.json
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
  # POST /admin/weeks.json
  def create
    @week = Week.new(week_params)

    respond_to do |format|
      if @week.save
        format.html { redirect_to [:admin, @week], notice: 'Week was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @week] }
      else
        format.html { render :new }
        format.json { render json: @week.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/weeks/1
  # PATCH/PUT /admin/weeks/1.json
  def update
    respond_to do |format|
      if @week.update(week_params)
        format.html { redirect_to [:admin, @week], notice: 'Week was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @week] }
      else
        format.html { render :edit }
        format.json { render json: @week.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/weeks/1
  # DELETE /admin/weeks/1.json
  def destroy
    @week.destroy
    respond_to do |format|
      format.html { redirect_to admin_weeks_url, notice: 'Week was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_week
      @week = Week.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def week_params
      params[:week].permit(:number, :status, :winner, :previous_week_id)
    end
end
