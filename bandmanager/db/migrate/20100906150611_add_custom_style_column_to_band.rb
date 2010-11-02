class AddCustomStyleColumnToBand < ActiveRecord::Migration
  def self.up
    add_column :bands, :custom_style, :text
  end

  def self.down
    remove_column :bands, :custom_style
  end
end
