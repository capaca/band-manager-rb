# Require and initialise any monkey-patches used by the application (patch code lives in lib/patches)
Dir[File.join(Rails.root, 'lib', 'patches', '**', '*.rb')].sort.each { |patch| require(patch) }

module ActiveRecord
  class Base
    class << self
      # Creates reader and writter methods for each translated 
      # attributes and the specificed locales. Ex:
      # 
      # Write accessor
      #
      # Person.name_en = "Peter Smith"
      # Person.name_pt = "Pedro Dias" 
      #
      # Read accessor
      #
      # Person.name_en
      # "Peter Smith"
      #
      # Person.name_pt
      # "Pedro Dias"
      # 
      def globalize_accessors(*locales)
        # Treats in case :available_locales passed in
        if locales and locales[0] and locales[0] == :available_locales
          locales = AVAILABLE_LOCALES
        end
        
        # In case if the locales[0] is an Array
        if locales and locales[0] and locales[0].class == Array
          locales = locales[0]
        end
        
        locales.each do |locale|
          locale_str = locale.to_s.gsub('-','_')
          
          self.translated_attribute_names.each do |attribute|
            # Writter
            define_method "#{attribute.to_s}_#{locale_str}=" do |arg|
              self.globalize.write(locale.to_s, attribute, arg)
            end        
            
            # Reader
            define_method "#{attribute.to_s}_#{locale_str}" do
              self.globalize.fetch(locale.to_s, attribute)
            end
          end
        end
      end
      
    end		
  end
end                   

