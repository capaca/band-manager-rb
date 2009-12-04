class SongFilesController < ApplicationController
  def create
    @song = Song.find(params[:song_id])
    @release = @song.release
    @band = @release.band 
    
    @song_file = SongFile.new(params[:song_file])
    @song_file.song = @song
    
    respond_to do |format|
      if @song_file.save
        flash[:notice] = get_message "song_file.create"
        format.html { render :template=> 'songs/edit.html.erb' }
        format.xml  { render :xml => @song_file, :status => :updated, :location => @song_file }
      else
        format.html { render :template=> 'songs/edit.html.erb' }
        format.xml  { render :xml => @song_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @song_file = SongFile.find(params[:id])    
    load_band_release_and_song(@song_file)
    
    respond_to do |format|
      if @song_file.update_attributes(params[:song_file])
        flash[:notice] = get_message "song_file.update"
        format.html { render :template=> 'songs/edit.html.erb' }
        format.xml  { render :xml => @song_file, :status => :updated, :location => @song_file }
      else
        format.html { render :template=> 'songs/edit.html.erb' }
        format.xml  { render :xml => @song_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @song_file = SongFile.find(params[:id])
    load_band_release_and_song(@song_file)
    
    if @song_file.destroy
      respond_to do |format|
        flash[:notice] = get_message "song_file.destroy"
        format.html { redirect_to edit_band_release_song_path(@band,@release,@song) }
      end
    end
  end
  
  private 
  
  def load_band_release_and_song(song_file)
    @song = song_file.song
    @release = @song.release
    @band = @release.band 
  end

end
