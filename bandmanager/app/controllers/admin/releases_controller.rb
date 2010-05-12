class Admin::ReleasesController < ApplicationController
  
  before_filter :authenticate_user!
  
  # GET /releases/new
  # GET /releases/new.xml
  def new
    @release = Release.new
    @band = Band.find(params[:band_id])
    @types = ReleaseType.all
  end

  # GET /releases/1/edit
  def edit
    @release = Release.find(params[:id])
    @band = @release.band
    @types = ReleaseType.all
  end

  # POST /releases
  # POST /releases.xml
  def create
    @band = Band.find(params[:band_id])
    @release = Release.new(params[:release])
    @release.band = @band
    
    if @release.save
      flash[:notice] = 'Release was successfully created.'
      redirect_to admin_band_path(@band, :anchor => 'releases')
    else
      @types = ReleaseType.all
      @release.cover = nil
      render :action => "new"
    end
  end

  # PUT /releases/1
  # PUT /releases/1.xml
  def update
    @release = Release.find(params[:id])
    @types = ReleaseType.all

    begin
      @release.update_attributes!(params[:release])
      
      flash[:notice] = 'Release was successfully updated.'
      redirect_to edit_admin_band_release_path(@release.band, @release)
    rescue
      @band = @release.band
      @types = ReleaseType.all
      
      render :action => "edit"
    end
  end

  # DELETE /releases/1
  # DELETE /releases/1.xml
  def destroy
    @release = Release.find(params[:id])
    @release.destroy
    redirect_to(admin_band_path(@release.band))
  end
  
end
