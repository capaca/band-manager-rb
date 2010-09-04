#-- auto documented by documentor :: Generated on 2010-03-21 ++
#
# = Description
# Write here the description for Song
#
# === Attributes
#
# +audio_content_type+:: +String+
# +audio_file_name+:: +String+
# +audio_file_size+:: +Integer+
# +audio_updated_at+:: +Datetime+
# +created_at+:: +Datetime+
# +lyrics+:: +Text+
# +release_id+:: +Integer+
# +time+:: +String+
# +title+:: +String+
# +track_number+:: +Integer+
# +updated_at+:: +Datetime+
#
#-- /auto documented by documentor ++
class Song < ActiveRecord::Base
  # release_id: integer
  # title:        string
  # track_number: integer
  # lyrics:       string
  
  belongs_to :release
 
  has_attached_file :audio
  validates_attachment_content_type :audio, :content_type => ['audio/mpeg', 'audio/x-mpeg', 'application/x-mp3', 'audio/mp3'  ]
  
  validates_presence_of :title, :track_number, :release_id
  validates_associated :release
  validates_uniqueness_of :track_number, :scope => :release_id
end
