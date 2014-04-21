class FaultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_fault, only: [:show, :edit, :update, :destroy]

  # GET /faults
  # GET /faults.json
  def index
    @faults = Fault.all
  end

  # GET /faults/1
  # GET /faults/1.json
  def show
  end

  # GET /faults/new
  def new
    @fault = Fault.new
  end

  # GET /faults/1/edit
  def edit
  end

  # POST /faults
  # POST /faults.json
  def create
    @fault = Fault.new(fault_params)

    respond_to do |format|
      if @fault.save
        format.html { redirect_to @fault, notice: 'Fault was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fault }
      else
        format.html { render action: 'new' }
        format.json { render json: @fault.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faults/1
  # PATCH/PUT /faults/1.json
  def update
    respond_to do |format|
      if @fault.update(fault_params)
        format.html { redirect_to @fault, notice: 'Fault was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fault.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faults/1
  # DELETE /faults/1.json
  def destroy
    @fault.destroy
    respond_to do |format|
      format.html { redirect_to faults_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fault
      @fault = Fault.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fault_params
      params.require(:fault).permit(:name)
    end
end
