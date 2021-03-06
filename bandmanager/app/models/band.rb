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
  
  has_many  :releases, :order => "year desc", :dependent => :destroy
  has_many  :posts, :order => "created_at desc", :dependent => :destroy
  
  has_attached_file :logo, :styles => { :normal => "600" }
  has_attached_file :photo, :styles => { :normal => "400", :mini => "150x150#" }
  
  validates_presence_of :name, :screen_name, :genre, :year, :city, :country_id
  validates_associated :genre, :country
  validates_uniqueness_of :screen_name
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,}\Z)/
  
  validates_numericality_of :year, :only_integer => true , 
                            :greater_than => 1900, 
                            :less_than_or_equal_to => Time.new.year
                            
  before_validation :downcase_screen_name
  
  translates :about
  globalize_accessors :available_locales
  
  def upcoming_concerts
    Concert.find(
      :all,
      :joins => "inner join bands_concerts bc on concerts.id = bc.concert_id",
      :conditions => ["bc.band_id = ? and concerts.date >= ?", self.id, Date.today],
      :order => "concerts.date asc"
    )
  end                                                  
  
  def has_past_concerts?
    Concert.count(
      :joins => "inner join bands_concerts bc on concerts.id = bc.concert_id",
      :conditions => ["bc.band_id = ? and concerts.date < ?", self.id, Date.today]
    ) > 0
  end
  
  def has_attached_songs?
    releases.each do |release|
      release.songs.each do |song|
        if song.audio.exists?
          return true
        end
      end
    end
    false
  end
  
  def paginate_posts(page)
    Post.paginate_by_band_id self.id, 
      :page => page, :order => 'created_at desc'
  end
  
  def paginate_concerts(page)
    Concert.paginate(
      :joins => 'inner join bands_concerts on id = concert_id',
      :conditions => ['band_id = ?', self.id],
      :page => page,
      :order => 'date desc'
    )
  end
  
  def last_posts(num)
    Post.find(:all, :conditions => ['band_id = ?', self.id], 
    :limit => num, :order => 'created_at desc')
  end
  
  private 
  
  def downcase_screen_name
    if self.screen_name
      self.screen_name.downcase!
    end
  end
end
