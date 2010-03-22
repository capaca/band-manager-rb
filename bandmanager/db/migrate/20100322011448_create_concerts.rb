class CreateConcerts < ActiveRecord::Migration
  def self.up
    create_table :concerts do |t|
      t.string :name
      t.date :date
      t.string :city
      t.string :region
      t.text :details
      t.belongs_to :country

      t.timestamps
    end
  end

  def self.down
    drop_table :concerts
  end
end
