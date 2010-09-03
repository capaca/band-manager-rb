class Configuration < ActiveRecord::Base
  include Singleton
  
  belongs_to :band
  
  def self.setup params
    instance = new params
    instance.save!
    instance
  end
end
