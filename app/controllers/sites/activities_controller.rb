class Sites::ActivitiesController < ApplicationController

  def new
    @activity = Activity.new
  end

  def create
    @site = Site.find(params[:id])

    @activity = @site.activities.build(activity_params)

    if @site.save
      redirect_to sites_projects_path
    else
      render 'new'
    end
  end

  private
    def activity_params
      params.require(:activity).permit(:site_id, :project_id)
    end
end
