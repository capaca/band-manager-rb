class CreateBands < ActiveRecord::Migration
  def self.up
    create_table :bands do |t|
      t.string      :name
      t.string      :screen_name
      t.belongs_to  :genre
      t.integer     :year
      t.string      :city
      t.belongs_to  :country
      t.text        :about

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
