class CreateBandsConcertsJoinTable < ActiveRecord::Migration
   def self.up
      create_table :bands_concerts, :id => false do |t|
        t.integer :band_id
        t.integer :concert_id
      end
    end

    def self.down
      drop_table :bands_concerts
    end

end
