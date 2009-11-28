class Genre < ActiveRecord::Base
  # title: string
  
  validates_presence_of :title
end
