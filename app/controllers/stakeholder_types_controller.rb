class StakeholderTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_stakeholder_type, only: [:show, :edit, :update, :destroy]

  # GET /stakeholder_types
  # GET /stakeholder_types.json
  def index
    @stakeholder_types = StakeholderType.all
  end

  # GET /stakeholder_types/1
  # GET /stakeholder_types/1.json
  def show
  end

  # GET /stakeholder_types/new
  def new
    @stakeholder_type = StakeholderType.new
  end

  # GET /stakeholder_types/1/edit
  def edit
  end

  # POST /stakeholder_types
  # POST /stakeholder_types.json
  def create
    @stakeholder_type = StakeholderType.new(stakeholder_type_params)

    respond_to do |format|
      if @stakeholder_type.save
        format.html { redirect_to @stakeholder_type, notice: 'Stakeholder type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @stakeholder_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @stakeholder_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stakeholder_types/1
  # PATCH/PUT /stakeholder_types/1.json
  def update
    respond_to do |format|
      if @stakeholder_type.update(stakeholder_type_params)
        format.html { redirect_to @stakeholder_type, notice: 'Stakeholder type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @stakeholder_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stakeholder_types/1
  # DELETE /stakeholder_types/1.json
  def destroy
    @stakeholder_type.destroy
    respond_to do |format|
      format.html { redirect_to stakeholder_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stakeholder_type
      @stakeholder_type = StakeholderType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stakeholder_type_params
      params.require(:stakeholder_type).permit(:stakeholder_type)
    end
end
