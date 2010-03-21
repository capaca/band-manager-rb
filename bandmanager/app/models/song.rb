#-- auto documented by documentor :: Generated on 2010-03-21 ++
#
# = Description
# Write here the description for Song
#
# === Attributes
#
# +created_at+:: +Datetime+
# +file_id+:: +Integer+
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
  
  validates_presence_of :title, :track_number, :release_id
  validates_associated :release
end
