class PlaylistsController < ApplicationController
  
  def index
    
  end
  
  def load
    band = Band.find(params[:id])
    song_list = ''
  
    # Generates the tracklist for each existent song file
    #
    tracklist = XSPF::Tracklist.new
  
    band.releases.each do |release|
      release.songs.each do |song|
        if song.audio.exists?
          tracklist << XSPF::Track.new( {
            :location => song.audio.url,
            :title => song.title,
            :tracknum => "#{song.track_number}",
            :album => song.release.title,
            :image => song.release.cover.url(:normal),
            :creator => song.release.band.name
          } )
        end
      end
    end
    
    # Generates the playlist with the recently generated track list
    #
    playlist = XSPF::Playlist.new( {
      :xmlns => 'http://xspf.org/ns/0/',
      :title => "#{band.name} playlist",
      :creator => 'BandManager',
      :info => 'http://www.bandmanager.com/',
      :tracklist => tracklist
     } )
     
    xspf = XSPF.new( { :playlist => playlist } )
    
    # Renders the xml for the generated XSPF
    #
    render :xml => xspf.to_xml
  end
end
