class Admin::ConfigurationController < ApplicationController

  before_filter :authenticate_user!
  
  def index
    @bands = Band.all
  end
  
  def update
  end
  
end
