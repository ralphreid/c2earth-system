class SitesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_site, only: [:show, :edit, :update, :destroy]

  # GET /sites
  # GET /sites.json
  def index
    @sites = Site.all
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
  end

  # GET /sites/new
  def new
    @site = Site.new
  end

  # GET /sites/1/edit
  def edit
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = Site.new(site_params)

    respond_to do |format|
      if @site.save
        format.html { redirect_to @site, notice: 'Site was successfully created.' }
        format.json { render action: 'show', status: :created, location: @site }
      else
        format.html { render action: 'new' }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sites/1
  # PATCH/PUT /sites/1.json
  def update
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to @site, notice: 'Site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site.destroy
    respond_to do |format|
      format.html { redirect_to sites_url }
      format.json { head :no_content }
    end
  end

  def lookup
    if params[:city]
      @sites = Site.lookup(params[:city])
    else
      @sites = Site.lookup
    end
  end

  def lookup_address
    #@target = Geocoder.coordinates(params[:address]) #[1123,232323]
    # @sites = Site.near(params[:address], 5)
    # @hash = Gmaps4rails.build_markers(@sites) do |site, marker|
    #   marker.lat site.latitude
    #   marker.lng site.longitude
    #   marker.infowindow "test string"
    # end
    @address = params[:address]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:number, :address, :city, :county, :loc_page, :loc_longitude, :loc_latitude, :apn, :tombrobox, :fault_id)
    end
end
