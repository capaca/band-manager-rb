class CreateReleases < ActiveRecord::Migration
  def self.up
    create_table :releases do |t|
      t.integer :band_id
      t.string  :title
      t.integer :year
      t.text    :details
      
      t.timestamps
    end
  end

  def self.down
    drop_table :releases
  end
end
