class Release < ActiveRecord::Base
  # band_id:  integer
  # title:    string
  # year:     integer
  # details   string
  
  belongs_to :band 
  belongs_to :cover,    :class_name => "ReleaseCover", :dependent => :destroy
  
  has_many :songs, :order => "track_number asc"
  
  validates_presence_of :title, :year, :band
  validates_associated  :band
  
  validates_length_of   :details, :minimum => 10
  
  validates_numericality_of :year, :only_integer => true
  
  def validate
    if year and band and band.year
      if year < band.year
        errors.add(:year, "deve ser maior ou igual ao ano da banda (#{band.year}).")
        return
      end
    
      if year > Time.new.year
        errors.add(:date, "deve ser menor ou igual ao ano atual (#{Time.new.year}).")
        return
      end
    end
  end  
                             
end
