class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.integer :release_id
      t.string  :title
      t.integer :track_number
      t.string  :time
      t.text    :lyrics
      
      t.timestamps
    end
  end

  def self.down
    drop_table :songs
  end
end
