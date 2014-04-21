class InvestigationTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_investigation_type, only: [:show, :edit, :update, :destroy]

  # GET /investigation_types
  # GET /investigation_types.json
  def index
    @investigation_types = InvestigationType.all
  end

  # GET /investigation_types/1
  # GET /investigation_types/1.json
  def show
  end

  # GET /investigation_types/new
  def new
    @investigation_type = InvestigationType.new
  end

  # GET /investigation_types/1/edit
  def edit
  end

  # POST /investigation_types
  # POST /investigation_types.json
  def create
    @investigation_type = InvestigationType.new(investigation_type_params)

    respond_to do |format|
      if @investigation_type.save
        format.html { redirect_to @investigation_type, notice: 'Investigation type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @investigation_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @investigation_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investigation_types/1
  # PATCH/PUT /investigation_types/1.json
  def update
    respond_to do |format|
      if @investigation_type.update(investigation_type_params)
        format.html { redirect_to @investigation_type, notice: 'Investigation type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @investigation_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investigation_types/1
  # DELETE /investigation_types/1.json
  def destroy
    @investigation_type.destroy
    respond_to do |format|
      format.html { redirect_to investigation_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investigation_type
      @investigation_type = InvestigationType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investigation_type_params
      params.require(:investigation_type).permit(:investigation_type)
    end
end
