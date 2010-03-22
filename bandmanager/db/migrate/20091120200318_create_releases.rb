class CreateReleases < ActiveRecord::Migration
  def self.up
    create_table :releases do |t|
      t.belongs_to  :band
      t.belongs_to  :type
      t.string      :title,   :null => false
      t.integer     :year,    :null => false
      t.text        :details, :null => false
      
      t.timestamps
      
      # Cover Columns
      t.string      :cover_file_name
      t.string      :cover_content_type
      t.integer     :cover_file_size
      t.datetime    :cover_updated_at
    end
  end

  def self.down
    drop_table :releases
  end
end
