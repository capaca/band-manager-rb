class ReleaseCover < Attachment
  has_attachment :content_type => :image, 
                 :storage => :file_system, 
                 :max_size => 2.megabytes,
                 :resize_to => '150'

  validates_as_attachment
end
