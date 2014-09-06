class Admin::DuoPicksController < AdminController
  before_action :set_admin_duo_pick, only: [:show, :edit, :update, :destroy]

  # GET /admin/duo_picks
  # GET /admin/duo_picks.json
  def index
    @duo_picks = DuoPick.all
  end

  # GET /admin/duo_picks/1
  def show
  end

  # GET /admin/duo_picks/new
  def new
    @duo_pick = DuoPick.new
  end

  # GET /admin/duo_picks/1/edit
  def edit
  end

  # POST /admin/duo_picks
  def create
    @duo_pick = DuoPick.new(duo_pick_params)
    if @duo_pick.save
      redirect_to edit_admin_duo_pick_path(@duo_pick), notice: 'Duo Pick was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/duo_picks/1
  def update
    if @duo_pick.update(duo_pick_params)
      redirect_to [:admin, @duo_pick], notice: 'Duo Pick was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/duo_picks/1
  def destroy
    @duo_pick.destroy
    redirect_to admin_duo_picks_url, notice: 'Duo Pick was successfully destroyed.'
  end

  private

    def set_admin_duo_pick
      @duo_pick = DuoPick.find(params[:id])
    end

    def duo_pick_params
      params[:duo_pick].permit!
    end
end
