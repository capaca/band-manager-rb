class ReleasesController < ApplicationController
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
      redirect_to(@band)
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
      redirect_to edit_band_release_path(@release.band, @release)
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

    respond_to do |format|
      format.html { redirect_to(@release.band) }
      format.xml  { head :ok }
    end
  end
  
  def destroy_cover
    @release = Release.find(params[:id])
  
    if(@release.cover)
      @release.cover.destroy
    end
    
    respond_to do |format|
      format.html { redirect_to edit_band_release_path(@release.band, @release) }
      format.xml  { head :ok }
    end
  end
end
