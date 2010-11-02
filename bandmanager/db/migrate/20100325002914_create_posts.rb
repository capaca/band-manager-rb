class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.belongs_to :band

      t.timestamps
    end
    Post.create_translation_table! :title => :string, :content => :text
  end

  def self.down
    drop_table :posts
    Post.drop_translation_table!
  end
end
