class Post < ActiveRecord::Base
  belongs_to :band
  
  translates :title, :content
  globalize_accessors :available_locales
  
  def self.per_page
    6
  end

end
