#-- auto documented by documentor :: Generated on 2010-03-21 ++
#
# = Description
# Write here the description for Release
#
# === Attributes
#
# +band_id+:: +Integer+
# +cover_content_type+:: +String+
# +cover_file_name+:: +String+
# +cover_file_size+:: +Integer+
# +cover_updated_at+:: +Datetime+
# +created_at+:: +Datetime+
# +details+:: +Text+
# +title+:: +String+
# +type_id+:: +Integer+
# +updated_at+:: +Datetime+
# +year+:: +Integer+
#
#-- /auto documented by documentor ++
class Release < ActiveRecord::Base
  # band_id:  integer
  # title:    string
  # year:     integer
  # details   string
  
  belongs_to :band 
  belongs_to :type, :class_name => "ReleaseType"
  belongs_to :cover, :class_name => "ReleaseCover", :dependent => :destroy
  
  has_attached_file :cover, :styles => { :normal => "150" }

  has_many :songs, :order => "track_number asc", :dependent => :destroy
  
  validates_presence_of :title, :year, :band, :type_id
  validates_associated  :band
  validates_length_of   :details, :minimum => 10
  validates_numericality_of :year, :only_integer => true
  validate :validate_year  
  
  # Validations
  # 
  def validate_year
    if year
      if band and band.year
        if year < band.year
          errors.add(:year, "deve ser maior ou igual ao ano de formação da banda (#{band.year}).")
        end
      end

      if year > Time.new.year
        errors.add(:year, "deve ser menor ou igual ao ano atual (#{Time.new.year}).")
      end
    end
    
  end
  
end
