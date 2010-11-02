class CreateAdminUser < ActiveRecord::Migration
  def self.up
    admin = User.new
    admin.email = 'admin@bandmanager.com'
    admin.password = 'passwd'
    admin.save
  end

  def self.down
    admin = User.find_by_email 'admin@bandmanager.com'
    admin.destroy
  end
end
