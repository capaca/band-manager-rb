class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.belongs_to :band
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
