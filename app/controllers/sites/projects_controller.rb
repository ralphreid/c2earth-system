class Sites::ProjectsController < ApplicationController

  def index
    @site = Site.find(params[:id])
    @projects = @site.projects
  end

  def new
    @project = Project.new
  end

  def create
    @site = Site.find(params[:id])

    @project = @site.projects.build(project_params)

    if @site.save
      redirect_to sites_projects_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  private
    def project_params
      params.require(:project).permit(:name, :name_alternate, :number, :prefix, :description)
    end
end
