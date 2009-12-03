class Song < ActiveRecord::Base
  # release_id: integer
  # title:        string
  # track_number: integer
  # lyrics:       string
  # file_id:      integer
  
  belongs_to :release
  belongs_to :file, :class_name => "SongFile", :dependent => :destroy
  
  validates_presence_of :title
end
