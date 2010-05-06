class SongsController < ApplicationController
  
  before_filter :authenticate_user!
  
  # GET /songs/1
  # GET /songs/1.xml
  def show
    @song = Song.find(params[:id])
  end

  # GET /songs/new
  # GET /songs/new.xml
  def new
    @release = Release.find(params[:release_id])
    @band = @release.band
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
    @release = Release.find(params[:release_id])
    @band = @release.band
    @song = Song.find(params[:id])
  end

  # POST /songs
  # POST /songs.xml
  def create
    @release = Release.find(params[:release_id])
    @band = @release.band
    @song = Song.new(params[:song])
    
    puts "\n\n\n\n\n*****ContentType: "+@song.audio.content_type.inspect+"\n\n\n\n\n"

    @song.release = @release

    if @song.save
      flash[:notice] = 'Song was successfully created.'
      redirect_to band_path(@band, :anchor => 'releases')
    else
      render :action => "new"
    end
  end

  # PUT /songs/1
  # PUT /songs/1.xml
  def update
    @song = Song.find(params[:id])

    if @song.update_attributes(params[:song])
      flash[:notice] = 'Song was successfully updated.'
      redirect_to band_path(@song.release.band, :anchor => 'releases')
    else
      @band = @song.release.band
      @release = @song.release
      render :action => "edit"
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.xml
  def destroy
    @song = Song.find(params[:id])
    band = @song.release.band
    @song.destroy

    redirect_to band_path(band, :anchor => 'releases')
  end
end
