class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.column :type, :string
      t.column :parent_id,  :integer
      t.column :content_type, :string
      t.column :filename, :string    
      t.column :thumbnail, :string 
      t.column :size, :integer
      t.column :width, :integer
      t.column :height, :integer
      
      # Association colums
      t.column :song_id, :integer
      
      t.timestamps
    end
  end

  def self.down
    drop_table :attachments
  end
end
