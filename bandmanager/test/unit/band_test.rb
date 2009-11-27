require 'test_helper'

class BandTest < ActiveSupport::TestCase
  
  test "Should save a band" do
    band = create_band
    assert_difference "Band.count" do
      band.save
    end
  end
  
  test "Should destroy a band" do
    band = create_band
    band.save
    
    assert_difference "Band.count", -1 do
      band.destroy
    end
  end
  
  test "Should validate presence of attributes" do
    validate_presence_of_band :name, :genre
  end
  
  private
    def create_band(options = {})
      band_hash = {
        :name => "Kreator", 
        :genre => genres(:thrash),
        :year => 1983,
        :city => "Essen",
        :country => countries(:germany),
        :about => "About Kreator..."
      }
      
      band = Band.new(band_hash.merge options)
    end
    
    def validate_presence_of_band(*attrs)
      attrs.each do |attr|
        band = create_band(attr => nil)
    
        assert_no_difference "Band.count" do
          band.save
        end
    
        assert band.errors
      end
    end
end
