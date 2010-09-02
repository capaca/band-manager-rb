class SiteController < ApplicationController
  
  before_filter :setar_screen_name
  
  def index
    @band = Band.find_by_screen_name(params[:screen_name])
    unless @band
      flash[:error] = "band_manager.errors.band.screen_name"
      render  :template => 'errors/error', 
              :layout => 'error', 
              :status => :error
              
      return
    end
  end
  
  def posts
    @band = Band.find_by_screen_name(params[:screen_name])
    @posts = @band.paginate_posts(params[:page])
  end
  
  def show_post
    @post = Post.find(params[:post_id])
  end
  
  def concerts
    @band = Band.find_by_screen_name(params[:screen_name])
    @concerts = @band.paginate_concerts(params[:page])
  end
  
  def show_concert
    @concert = Concert.find(params[:concert_id])
  end
  
  def show_song
    @song = Song.find(params[:song_id])
  end
  
  private
  
  def setar_screen_name
    unless params[:screen_name]
      band = Band.first
      params[:screen_name] = band.screen_name if band
    end
  end

end
