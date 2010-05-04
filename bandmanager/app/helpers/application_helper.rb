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
  
  def datepicker(*ids)
    output = ""
    ids.each do |id|
      output << "$('##{id}').datepicker({ 
        dateFormat: 'dd/mm/yy', 
        closeText:'Done',
        prevText:'Anterior',
        nextText:'Próximo',
        currentText:'Hoje',
        monthNames:[
          'Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto',
          'Setembro','Outubro','Novembro','Dezembro'
        ],
        monthNamesShort:[
          'Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'
        ],
        dayNames:[
          'Domingo','Segunda-feira','Terça-feira','Quarta-feira','Quinta-feira',
          'Sexta-feira','Sábado'
        ],
        dayNamesShort:['Dom','Seg','Ter','Qua','Qui','Sex','Sáb'],
        dayNamesMin:['Dom','Seg','Ter','Qua','Qui','Sex','Sáb']
      });\n"
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

  def field_label(model_attribute, options = {})
    label_tag '', "#{t_attr model_attribute}:", options

  end
  
  def strip_html(str)
    str.gsub(/<\/?[^>]*>/,  "")
  end
  
  def play_audio(playlist_url, autoplay, flash_player_path, width, height)
    output = "
      <script type='text/javascript'>
        var flashvars = {
          playlist_url: \"#{playlist_url}\",
          autoplay: \"#{autoplay}\"
        };
    
        var attributes = {};
        var params = {};

        swfobject.embedSWF(
          \"#{flash_player_path}\", 'flash_content', \"#{width}\", \"#{height}\", 
          '10.0.0', 'expressInstall.swf', flashvars, params, attributes
        );
      </script>"
  end

end
