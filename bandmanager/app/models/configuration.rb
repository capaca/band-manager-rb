class Configuration < ActiveRecord::Base
  acts_as_singleton  
  belongs_to :band
  
  def self.setup(band = nil)
    conf = instance 
    if band
      conf.band = band
    else
      conf.band = nil
    end
    
    conf.save!
    conf
  end
  
  def self.band
    Configuration.instance.band
  end
  
  private
  
  def destroy
    super
  end
end
