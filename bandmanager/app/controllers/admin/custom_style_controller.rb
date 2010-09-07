class Admin::CustomStyleController < Admin::BaseController

  def edit
    @band = Band.find(params[:id])
  end
  
  def preview
    @band = Band.find params[:id]
    @band.custom_style = params[:custom_style]
    render  :template => 'site/index', 
            :layout => 'site_preview', 
            :status => :error
  end
  
  def update
    @band = Band.find params[:id]
    @band.custom_style = params[:custom_style]
    
    @band.save
    redirect_to "/admin/custom_style/edit/#{@band.id}"
  end
  
  private
  
#  def object
#    @configuration ||= Configuration.instance
#  end
  
end
