#-- auto documented by documentor :: Generated on 2010-03-21 ++
#
# = Description
# Write here the description for Concert
#
# === Attributes
#
# +city+:: +String+
# +country_id_id+:: +Integer+
# +created_at+:: +Datetime+
# +date+:: +Date+
# +details+:: +Text+
# +name+:: +String+
# +region+:: +String+
# +updated_at+:: +Datetime+
#
#-- /auto documented by documentor ++
class Concert < ActiveRecord::Base

  has_and_belongs_to_many :bands
  belongs_to :country
  
  validates_presence_of :name, :date, :city, :country_id
end
