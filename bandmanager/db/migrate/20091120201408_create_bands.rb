class CreateBands < ActiveRecord::Migration
  def self.up
    create_table :bands do |t|
      t.string      :name, :null => false
      t.belongs_to  :genre, :null => false
      t.integer     :year, :null => false
      t.string      :city, :null => false
      t.belongs_to  :country, :null => false
      t.text        :about, :null => false  
      t.integer     :logo_id
      t.integer     :picture_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bands
  end
end
