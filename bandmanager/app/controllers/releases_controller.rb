class ReleasesController < ApplicationController
  # GET /releases/new
  # GET /releases/new.xml
  def new
    @band = Band.find(params[:band_id])
    @release = Release.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @release }
    end
  end

  # GET /releases/1/edit
  def edit
    @release = Release.find(params[:id])
    @band = @release.band
  end

  # POST /releases
  # POST /releases.xml
  def create
    @band = Band.find(params[:band_id])
    @release = Release.new(params[:release])
    @release.band = @band
    
    if(params[:cover])
      @release.cover = ReleaseCover.new(params[:cover])
    end
    
    respond_to do |format|
      if @release.save
        flash[:notice] = 'Release was successfully created.'
        format.html { redirect_to(@band) }
        format.xml  { render :xml => @release, :status => :created, :location => @release }
      else
        @release.cover = nil
        format.html { render :action => "new" }
        format.xml  { render :xml => @release.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /releases/1
  # PUT /releases/1.xml
  def update
    @release = Release.find(params[:id])

    respond_to do |format|
      begin
        @release.update_attributes!(params[:release])
        
        if(@release.cover.nil?)
          @release.cover = ReleaseCover.new(params[:cover])
          @release.save!
        else
          @release.cover.update_attributes!(params[:cover])
        end
        
        flash[:notice] = 'Release was successfully updated.'
        format.html { redirect_to(@release.band) }
        format.xml  { head :ok }

      rescue
        @band = @release.band
        
        format.html { render :action => "edit" }
        format.xml  { render :xml => @release.errors, :status => :unprocessable_entity }
      end
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
