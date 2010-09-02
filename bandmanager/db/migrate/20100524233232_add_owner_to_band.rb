class AddOwnerToBand < ActiveRecord::Migration
  def self.up
    add_column :bands, :user, :integer
  end

  def self.down
    remove_column :bands, :user
  end
end
