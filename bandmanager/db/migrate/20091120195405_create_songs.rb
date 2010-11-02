class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.integer :release_id
      t.string  :title
      t.integer :track_number
      t.string  :time
      t.text    :lyrics
      
      t.timestamps
      
      # Audio Columns
      t.string      :audio_file_name
      t.string      :audio_content_type
      t.integer     :audio_file_size
      t.datetime    :audio_updated_at
    end
  end

  def self.down
    drop_table :songs
  end
end
