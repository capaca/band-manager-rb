class CreateReleases < ActiveRecord::Migration
  def self.up
    create_table :releases do |t|
      t.belongs_to  :band
      t.belongs_to  :type
      t.string      :title,   :null => false
      t.integer     :year,    :null => false
      t.text        :details, :null => false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :releases
  end
end
