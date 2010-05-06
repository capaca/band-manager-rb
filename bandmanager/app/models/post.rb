class Post < ActiveRecord::Base
  belongs_to :band
  
  def self.per_page
    6
  end

end
