class InsertGenres < ActiveRecord::Migration
  def self.up
    Genre.create(:title => 'Thrash Metal')
    Genre.create(:title => 'Death Metal')
    Genre.create(:title => 'Grind Core')
    Genre.create(:title => 'Hard Core')
    Genre.create(:title => 'Crossover')
    Genre.create(:title => 'Grunge')
  end

  def self.down
    Genre.delete_all
  end
end
