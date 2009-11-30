class BandPicture < Attachment
  has_attachment :content_type => :image, 
                 :storage => :file_system, 
                 # :max_size => 500.kilobytes,
                 :resize_to => '300',
                 :thumbnails => { :thumb => '100' }

  validates_as_attachment
end
