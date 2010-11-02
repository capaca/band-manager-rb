#-- auto documented by documentor :: Generated on 2010-03-21 ++
#
# = Description
# Write here the description for Country
#
# === Attributes
#
# +name+:: +String+
#
#-- /auto documented by documentor ++
class Country < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false;
  
  def name
    name = read_attribute(:name)
    if(name)
      read_attribute(:name).capitalize
    end
  end
end
