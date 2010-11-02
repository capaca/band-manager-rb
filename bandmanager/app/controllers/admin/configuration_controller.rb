class Admin::ConfigurationController < Admin::BaseController

  permissions :configuration

  def edit
    @bands = Band.all
    @configuration = Configuration.instance
  end
  
  def update
    if params[:band_id]
      band = Band.find params[:band_id]
      Configuration.setup(band)
    else
      Configuration.setup
    end
    
    redirect_to :action => :edit
  end
  
  private
  
  def object
    @configuration ||= Configuration.instance
  end
  
end
