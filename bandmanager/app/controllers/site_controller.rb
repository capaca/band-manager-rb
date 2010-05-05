class SiteController < ApplicationController
  before_filter :find_band
  
  def index
  end
  
  def posts
    @posts = @band.posts
  end
  
  def show_post
    @post = Post.find(params[:post_id])
  end
  
  private 
  
  def find_band
    if params[:screen_name]
      @band = Band.find_by_screen_name(params[:screen_name])
    end
    
    @band = Band.find_by_name('Violator')
  end
end
