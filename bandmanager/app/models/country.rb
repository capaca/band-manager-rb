class Country < ActiveRecord::Base
  # name: string
  
  validates_presence_of :name
end
