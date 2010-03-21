#-- auto documented by documentor :: Generated on 2010-03-21 ++
#
# = Description
# Write here the description for Band
#
# === Attributes
#
# +about+:: +Text+
# +city+:: +String+
# +country_id+:: +Integer+
# +created_at+:: +Datetime+
# +genre_id+:: +Integer+
# +name+:: +String+
# +updated_at+:: +Datetime+
# +year+:: +Integer+
#
#-- /auto documented by documentor ++
class Band < ActiveRecord::Base
  # name: string
  # genre: Genre
  # year: integer
  # city: string
  # country: Country
  # about: text
  
  belongs_to :genre
  belongs_to :country
  
  has_many   :releases, :order => "year asc"
  
  validates_presence_of :name, :genre, :year, :city, :country_id, :about
  validates_associated :genre, :country
  validates_length_of :about, :minimum => 10;
  
  validates_numericality_of :year, :only_integer => true , 
                            :greater_than => 1900, 
                            :less_than_or_equal_to => Time.new.year                                                   
  
end
