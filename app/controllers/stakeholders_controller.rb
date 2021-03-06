class StakeholdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_stakeholder, only: [:show, :edit, :update, :destroy]

  # GET /stakeholders
  # GET /stakeholders.json
  def index
    @stakeholders = Stakeholder.all
  end

  # GET /stakeholders/1
  # GET /stakeholders/1.json
  def show
  end

  # GET /stakeholders/new
  def new
    @stakeholder = Stakeholder.new
  end

  # GET /stakeholders/1/edit
  def edit
  end

  # POST /stakeholders
  # POST /stakeholders.json
  def create
    @stakeholder = Stakeholder.new(stakeholder_params)

    respond_to do |format|
      if @stakeholder.save
        format.html { redirect_to @stakeholder, notice: 'Stakeholder was successfully created.' }
        format.json { render action: 'show', status: :created, location: @stakeholder }
      else
        format.html { render action: 'new' }
        format.json { render json: @stakeholder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stakeholders/1
  # PATCH/PUT /stakeholders/1.json
  def update
    respond_to do |format|
      if @stakeholder.update(stakeholder_params)
        format.html { redirect_to @stakeholder, notice: 'Stakeholder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @stakeholder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stakeholders/1
  # DELETE /stakeholders/1.json
  def destroy
    @stakeholder.destroy
    respond_to do |format|
      format.html { redirect_to stakeholders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stakeholder
      @stakeholder = Stakeholder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stakeholder_params
      params.require(:stakeholder).permit(:stakeholder_type_id, :company_id, :name, :name, :address, :city, :state, :zip, :work_phone, :home_phone, :cell_phone, :fax_phone, :email, :address_alternate, :city_alternate, :state_alternate, :zip_alternate, :work_phone_alternate, :home_phone_alternate, :cell_phone_alternate, :fax_phone_alternate, :email_alternate, :notes)
    end
end
