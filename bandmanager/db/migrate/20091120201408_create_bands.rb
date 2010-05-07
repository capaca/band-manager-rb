class CreateBands < ActiveRecord::Migration
  def self.up
    create_table :bands do |t|
      t.string      :name, :null => false
      t.string      :screen_name, :null => false
      t.belongs_to  :genre, :null => false
      t.integer     :year, :null => false
      t.string      :city, :null => false
      t.belongs_to  :country, :null => false
      t.text        :about, :null => false  

      t.timestamps

      # Logo Columns
      t.string      :logo_file_name
      t.string      :logo_content_type
      t.integer     :logo_file_size
      t.datetime    :logo_updated_at
      
      # Photo Columns
      t.string      :photo_file_name
      t.string      :photo_content_type
      t.integer     :photo_file_size
      t.datetime    :photo_updated_at
    end
    Band.create_translation_table! :about => :text
  end

  def self.down
    drop_table :bands
    Band.drop_translation_table!
  end
end
