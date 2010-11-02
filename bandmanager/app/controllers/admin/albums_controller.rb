class Admin::AlbumsController < ApplicationController

  def index
    redirect_to RubyPicasa.authorization_url(auth_result_url)
  end
  
  private 
  
  def object
    @band ||= Band.first
  end
  
end
