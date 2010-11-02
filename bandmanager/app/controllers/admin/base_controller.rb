class Admin::BaseController < ApplicationController
  before_filter :authenticate_user!
  before_filter :configurate
  
  private
  
  def configurate
    
    if should_redirect_to_configuration_page?
      flash[:notice] = "band_manager.admin.configuration.not_configured"
      redirect_to :controller => :configuration, :action => :edit
    end
    
  end
  
  def should_redirect_to_configuration_page?
    if RAILS_ENV != 'test' 
      (self.class.name != Admin::ConfigurationController.name) and 
      current_user.may_configurate? and
      Configuration.count == 0
    end
    
    false
  end
end
