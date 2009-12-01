class Release < ActiveRecord::Base
  # band_id:  integer
  # title:    string
  # year:     integer
  # details   string
  
  belongs_to :band 
  
  validates_presence_of :title, :year, :band
  validates_associated  :band
  
  validates_length_of   :details, :minimum => 10;
  
  validates_numericality_of :year, :only_integer => true
  
  def validate
    if year and band and band.year
      if year < band.year
        errors.add(:year, "deve ser maior ou igual ao ano da banda (#{band.year}).")
        return
      end
    
      if year > band.year
        end_date = Converters::date_to_string(destination.end_date)
        errors.add(:date, "deve ser menor ou igual ao anoda banda (#{band.year}).")
        return
      end
    end
  end  
                             
end
