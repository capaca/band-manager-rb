class AddOwnerToBand < ActiveRecord::Migration
  def self.up
    add_column :bands, :user, :belongs_to
  end

  def self.down
    remove_column :bands, :user
  end
end
