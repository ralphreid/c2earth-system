class ProjectManagersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project_manager, only: [:show, :edit, :update, :destroy]

  # GET /project_managers
  # GET /project_managers.json
  def index
    @project_managers = ProjectManager.all
  end

  # GET /project_managers/1
  # GET /project_managers/1.json
  def show
  end

  # GET /project_managers/new
  def new
    @project_manager = ProjectManager.new
  end

  # GET /project_managers/1/edit
  def edit
  end

  # POST /project_managers
  # POST /project_managers.json
  def create
    @project_manager = ProjectManager.new(project_manager_params)

    respond_to do |format|
      if @project_manager.save
        format.html { redirect_to @project_manager, notice: 'Project manager was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project_manager }
      else
        format.html { render action: 'new' }
        format.json { render json: @project_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_managers/1
  # PATCH/PUT /project_managers/1.json
  def update
    respond_to do |format|
      if @project_manager.update(project_manager_params)
        format.html { redirect_to @project_manager, notice: 'Project manager was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_managers/1
  # DELETE /project_managers/1.json
  def destroy
    @project_manager.destroy
    respond_to do |format|
      format.html { redirect_to project_managers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_manager
      @project_manager = ProjectManager.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_manager_params
      params.require(:project_manager).permit(:name)
    end
end
