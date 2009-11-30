class BandLogo < Attachment
  has_attachment :content_type => :image, 
                 :storage => :file_system, 
                 # :max_size => 500.kilobytes,
                 :resize_to => '600'

  validates_as_attachment
end
