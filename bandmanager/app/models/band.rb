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
# +logo_content_type+:: +String+
# +logo_file_name+:: +String+
# +logo_file_size+:: +Integer+
# +logo_updated_at+:: +Datetime+
# +name+:: +String+
# +photo_content_type+:: +String+
# +photo_file_name+:: +String+
# +photo_file_size+:: +Integer+
# +photo_updated_at+:: +Datetime+
# +updated_at+:: +Datetime+
# +year+:: +Integer+
#
#-- /auto documented by documentor ++
class Band < ActiveRecord::Base
  belongs_to :genre
  belongs_to :country

  has_and_belongs_to_many :concerts, :order => 'date desc'
  
  has_many   :releases, :order => "year asc", :dependent => :destroy
  
  has_attached_file :logo, :styles => { :normal => "600" }
  has_attached_file :photo, :styles => { :normal => "400", :mini => "150x150#" }
  
  validates_presence_of :name, :genre, :year, :city, :country_id, :about
  validates_associated :genre, :country
  validates_length_of :about, :minimum => 10;
  
  validates_numericality_of :year, :only_integer => true , 
                            :greater_than => 1900, 
                            :less_than_or_equal_to => Time.new.year
                            
  def upcoming_concerts
    Concert.find(
      :all,
      :joins => "inner join bands_concerts bc on concerts.id = bc.concert_id",
      :conditions => ["bc.band_id = ? and concerts.date >= ?", self.id, Date.today]
    )
  end                                                  
  
  def has_past_concerts?
    Concert.count(
      :joins => "inner join bands_concerts bc on concerts.id = bc.concert_id",
      :conditions => ["bc.band_id = ? and concerts.date < ?", self.id, Date.today]
    ) > 0
  end
  
end
