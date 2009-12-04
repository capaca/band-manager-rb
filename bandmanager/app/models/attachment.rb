class Attachment < ActiveRecord::Base

  def short_filename
    name = ''
  
    if(public_filename)
      name_parts = public_filename.split("/")
      name = name_parts[name_parts.length-1]
    end
  end

end
