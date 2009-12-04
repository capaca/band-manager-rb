# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def check_tab(menu_item)
    if controller_name == menu_item
      "current_page_item"
    end
  end

  def corner(*ids)
    output = ""
    ids.each do |id|
      output << "$('##{id}').corner();\n" 
    end
    
    puts_javascript output
  end
  
  def mask(hash)
    output = ""
    hash.keys.each do |key|
      output << "$('##{key.to_s}').mask(\"#{hash[key]}\");\n" 
    end
    
    puts_javascript output
  end
  
  def puts_javascript(output)
    %Q{
      <script type="text/javascript">
          $(document).ready(function(){
              #{output}
          });
      </script>
    }
  end
  
  def filter(hash)
    output = ""
    hash.keys.each do |key|
      if(hash[key] == :digit)
        hash[key] = "/[\\d]/"
      end
      
      output << "$('##{key.to_s}').keyfilter(\"#{hash[key]}\");\n" 
    end
    
    puts_javascript output
  end

  def t_attr(model_attribute)
    t "activerecord.attributes.#{model_attribute}"
  end

  def field_label(model_attribute)
    "<label>#{t_attr model_attribute}:</label>"
  end

end
