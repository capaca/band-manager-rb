class AddProfileToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :profile, :integer
  end

  def self.down
    remove_column :users, :profile
  end
end
