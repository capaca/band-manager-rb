class Country < ActiveRecord::Base
  # name: string
  
  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false;
  
  def name
    read_attribute(:name).capitalize
  end
end
