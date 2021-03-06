#-- auto documented by documentor :: Generated on 2010-03-21 ++
#
# = Description
# Write here the description for Genre
#
# === Attributes
#
# +title+:: +String+
#
#-- /auto documented by documentor ++
class Genre < ActiveRecord::Base
  # title: string
  
  validates_presence_of :title
  validates_uniqueness_of :title, :case_sensitive => false;
  
  def title
    title = read_attribute(:title)
    
    if(title)
      title.capitalize
    end
  end  
end
