# Require and initialise any monkey-patches used by the application (patch code lives in lib/patches)
Dir[File.join(Rails.root, 'lib', 'patches', '**', '*.rb')].sort.each { |patch| require(patch) }

module ActiveRecord
  class Base
    class << self
      # Cria um metodo getter e um setter(=) com o sufixo _str, que
      # converte para os formatos de data estabelecidos
      #
      def act_as_virtual_date(*attributes)
      
        attributes.each do |attribute|
          # Setter
          define_method "#{attribute.to_s}_str=" do |arg|
            send("#{attribute.to_s}=", to_date(arg, true))
          end        
          # Getter
          define_method "#{attribute.to_s}_str" do
            date_format send("#{attribute.to_s}")
          end
        end
      end
    end		
  end
end                   

