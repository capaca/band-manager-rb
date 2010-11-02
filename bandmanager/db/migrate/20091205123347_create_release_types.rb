class CreateReleaseTypes < ActiveRecord::Migration
  def self.up
    create_table :release_types do |t|
      t.string :title
    end
  end

  def self.down
    drop_table :release_types
  end
end
