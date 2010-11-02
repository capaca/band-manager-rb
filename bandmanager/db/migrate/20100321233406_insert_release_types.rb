class InsertReleaseTypes < ActiveRecord::Migration
  def self.up
    ReleaseType.create(:title => 'Full-lenght')
    ReleaseType.create(:title => 'EP')
    ReleaseType.create(:title => 'DVD')
  end

  def self.down
    ReleaseType.delete_all
  end
end
