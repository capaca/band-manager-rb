class Band < ActiveRecord::Base
  # name: string
  # genre: Genre
  # year: integer
  # city: string
  # country: Country
  # about: text
  
  belongs_to :genre
  belongs_to :country

  belongs_to :logo,    :class_name => "Attachment", :dependent => :destroy
  belongs_to :picture, :class_name => "Attachment", :dependent => :destroy
  
  validates_presence_of :name, :genre, :year, :city, :country, :about
  validates_associated :genre, :country
  validates_length_of :about, :minimum => 10;
  
  validates_numericality_of :year, :only_integer => true , 
                            :greater_than => 1900, 
                            :less_than_or_equal_to => Time.new.year
                            
  def picture_uploaded_data=(uploaded_data)
    if(picture == nil)
      picture = Attachment.new
    end
    
    picture.uploaded_data=uploaded_data
  end                            
  
end
