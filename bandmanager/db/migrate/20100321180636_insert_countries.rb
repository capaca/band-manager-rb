class InsertCountries < ActiveRecord::Migration
  def self.up
    file = File.open 'db/scripts/countries.sql'
    
    Country.create(:name => 'Brasil')
    Country.create(:name => 'Argentina')
    Country.create(:name => 'Chile')
    Country.create(:name => 'Peru')
    Country.create(:name => 'Paraguai')
  end

  def self.down
    Country.connection.execute('delete from countries')
  end
end
