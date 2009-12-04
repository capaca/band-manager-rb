class Song < ActiveRecord::Base
  # release_id: integer
  # title:        string
  # track_number: integer
  # lyrics:       string
  # file_id:      integer
  
  belongs_to :release
  has_one :file, :class_name => "SongFile", :dependent => :destroy
  
  validates_presence_of :title
end
