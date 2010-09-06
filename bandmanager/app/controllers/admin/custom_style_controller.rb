class Admin::CustomStyleController < Admin::BaseController

  def edit
    @band = Band.find(params[:id])
  end
  
  def preview
    @band = Band.find params[:id]
    @band.custom_style = params[:custom_style]
    render  :template => 'site/index', 
            :layout => 'site', 
            :status => :error
  end
  
  def update
  end
  
  private
  
#  def object
#    @configuration ||= Configuration.instance
#  end
  
end
