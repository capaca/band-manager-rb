MODEL_DIR_PATH = 'app/models/'

class Documentor

  @@BEGIN_DOC_REGEX = /^#\-\- auto documented by documentor.*/
  @@END_DOC_REGEX = /^#\-\- \/auto documented by documentor \+\+.*/

  def initialize models_dir
    @models_dir = models_dir
    @dir = Dir.new @models_dir
  end
  
  def add
    #arquivos = ['pessoa_juridica.rb']
    #arquivos.each do |entry|
    @dir.entries.each do |entry|
      if rb? entry
        puts "Documentando para o arquivo => #{entry}"
        require @models_dir+entry
        
        file = File.open(@models_dir+entry, 'r')
        @file_content = file.readlines
        file.rewind

        if not_documented? file
          puts "#{entry} não esta documentado ainda."
          file.each do |line|
            if line =~ /^class.*/
              puts "Achou a linha da classe"
              class_name = line.split(' ')[1]
              @doc = generate_text_doc_for class_name
            end  
          end
          file.close
          file = File.open(@models_dir+entry, 'w')
          file.write(@doc)
          file.close
          
          file = File.open(@models_dir+entry, 'a')
          file.write(@file_content)
          file.close
        else
          puts "#{entry} já está documentado."
        end

      end
    end
  end
  
  def remove
    #arquivos = ['pessoa_juridica.rb']
    #arquivos.each do |entry|
    @dir.entries.each do |entry|
      if rb? entry
        puts "Removendo documentação do arquivo => #{entry}"
        require @models_dir+entry
        
        file = File.open(@models_dir+entry, 'r')
        @file_content = file.readlines
        file.rewind
        
        lines_to_remove = []        
                
        if documented? file
          
          remove = false
          
          file.each do |line|
            if line =~ @@BEGIN_DOC_REGEX
              remove = true
            end
            
            if line =~ @@END_DOC_REGEX
              remove = false
              lines_to_remove << line
            end
            
            if remove
              lines_to_remove << line
            end
          end
        
          good_lines = []  
          
          file.rewind
          file.each do |line| 
            found = false
            lines_to_remove.each do |line_to_remove|
              if line_to_remove == line
               found = true
              end
            end
            
            unless found 
              good_lines << line
            end
          end
          file.close
          file = File.open(@models_dir+entry, 'w')
          
          good_lines.each do |line|
            file.write line
          end
          
          file.close
        else
          puts "#{entry} não está documentado."
        end

      end
    end
  end
  
  def update
    self.remove
    self.add
  end
  
  private
  
  # Retorna true caso a String termine com .rb e false caso o contrário
  def rb?(value)
    return value =~ /.*.rb$/
  end

  # Verifica se o arquivo ainda não documentado. Retorna false caso a primeira linha
  # do arquivo comece com '= Descrição' e true caso contrário
  def not_documented? file
    if documented? file
     return false
    end

    true
  end
  
  # Verifica se o arquivo já foi documentado. Retorna true caso a primeira linha
  # do arquivo comece com '= Descrição' e false caso contrário
  def documented? file
    file.rewind
    file_content = file.read
    if file_content =~ @@BEGIN_DOC_REGEX and
       file_content =~ @@END_DOC_REGEX
       
      file.rewind
      return true
    end
    
    file.rewind
    false
  end

  # Gera o texto de documentação a partir do nome da classe
  def generate_text_doc_for class_name
    
    time = t = Time.now
    time_str = t.strftime("%Y-%m-%d")
    
    object = eval "#{class_name}.new"
    doc = "#-- auto documented by documentor :: Generated on #{time_str} ++\n"
    doc << "#\n"
    doc << "# = Description\n"
    doc << "# Write here the description for #{class_name}\n"
    doc << "#\n"
    doc << "# === Attributes\n"
    doc << "#\n"
    object.attributes.sort.each do |attr|
      doc << "# +#{attr}+:: +#{object.column_for_attribute(attr).type.to_s.capitalize}+\n"
    end
    doc << "#\n"
    doc << "#-- /auto documented by documentor ++\n"
    puts doc
    doc
  end
end


def require_all
  require 'rubygems'
  require 'active_record'
  require 'config/boot.rb'
  require 'config/environment.rb'
end

option = ARGV[0]

documentor = Documentor.new MODEL_DIR_PATH

case option
  when "add" then 
    require_all
    documentor.add
  when "remove" then 
    require_all
    documentor.remove
  when "update" then 
    require_all
    documentor.update
  else puts "options: add | remove | update"
end
