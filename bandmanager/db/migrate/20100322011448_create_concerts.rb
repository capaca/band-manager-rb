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
      
      # Logo Columns
      t.string      :flyer_file_name
      t.string      :flyer_content_type
      t.integer     :flyer_file_size
      t.datetime    :flyer_updated_at

    end
    Concert.create_translation_table! :details => :text
  end

  def self.down
    drop_table :concerts
    Concert.drop_translation_table!
  end
end
