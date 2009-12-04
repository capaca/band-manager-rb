class SongFile < Attachment
  has_attachment :content_type => 'audio/mpeg',
                 :storage => :file_system, 
                 :max_size => 5.megabytes

  belongs_to :song
  
  validates_as_attachment
end
