class SiteController < ApplicationController
  def index
    if params[:screen_name]
      @band = Band.find_by_screen_name(params[:screen_name])
    end
    
    @band = Band.find_by_name('Violator')
  end
end
