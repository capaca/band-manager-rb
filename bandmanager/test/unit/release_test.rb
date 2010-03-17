require 'test_helper'

class ReleaseTest < ActiveSupport::TestCase
  
  test "Should save a release" do
    band = create_release
    assert_difference "Release.count" do
      release.save
    end
  end
  
  test "Should destroy a release" do
    release = create_release
    release.save
    
    assert_difference "Release.count", -1 do
      release.destroy
    end
  end
  
  test "Should validate presence of attributes" do
    validate_presence_of_release :name, :genre, 
    	:year, :city, :country, :about
  end
  
  # Private methods
  private
    def create_release(options = {})
      release_hash = {
        :band => bands(:violator)
        t.integer :band_id
        t.integer :type_id
        t.string  :title
        t.integer :year
        t.text    :details
        t.integer :cover_id
      }
      
      band = Band.new(band_hash.merge options)
    end
    
    def assert_error_on_save(band, attr)
      assert_no_difference "Band.count" do
  		  band.save
  		end
  	
  	  assert band.errors[attr]
    end
    
    def validate_presence_of_band(*attrs)
      attrs.each do |attr|
        band = create_band(attr => nil)
    
        assert_no_difference "Band.count" do
          band.save
        end
    
        assert band.errors[attr]
      end
    end
end
