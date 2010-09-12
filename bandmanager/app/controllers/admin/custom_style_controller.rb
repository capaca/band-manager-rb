class Admin::CustomStyleController < Admin::BaseController

  permissions :custom_style
  
  def edit
    @band = Band.find params[:id]
    
    if params[:custom_style]
      @band.custom_style = params[:custom_style]
    end
    
    render  :template => 'site/index', 
            :layout => 'site_preview'
  end
    
  def update
    @band = Band.find params[:id]
    @band.custom_style = params[:custom_style]
    
    if @band.save
      redirect_to "/admin/custom_style/edit/#{@band.id}"
    else
      puts @band.errors.inspect
      render  :template => 'site/index', 
              :layout => 'site_preview'
    end
  end
  
  private
  
  def object
    @band ||= Band.find(params[:id])
  end
  
end
