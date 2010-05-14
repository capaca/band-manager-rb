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
    band = Band.new
    assert_error_on_save band, :name, :genre, 
    	:year, :city, :country_id, :about, :screen_name
  end
  
  test "Should validate length of about attribute" do
  	band = create_band :about => 'abc' # 3 characters length
  	assert_error_on_save band, :about
  end
  
  test "Should validate namericality of year attribute" do
  	band = create_band :year => 'abc' # non numerical value
  	assert_error_on_save band, :year
  end
  
  test "Should validate year attribute >= 1900" do
  	band = create_band :year => 1899 # numver less than 1900
  	assert_error_on_save band, :year
  end
  
  test "Should validate year attribute <= current year" do
  	band = create_band :year => Time.new.year + 1 # current year + 1
  	assert_error_on_save band, :year
  end
  
  test "Should validate association with a valid country" do
    band = create_band :country => Country.new # invalid country
    assert_error_on_save band, :country
  end
  
  test "Should validate association with a valid genre" do
    band = create_band :genre => Genre.new # invalid genre
    assert_error_on_save band, :genre
  end
  
  test "Should retrieve all upcoming concerts of the band" do
    concerts = bands(:violator).upcoming_concerts
    assert_not_nil concerts

    concerts.each do |concert|
      assert concert.bands.member? bands(:violator)
      assert concert.date >= Date.today
    end
  end
  
  test "Should tell if the band has past concerts" do
    assert bands(:violator).has_past_concerts?
    
    # Delete the concert in the past
    assert concerts(:concert2).destroy
    
    assert bands(:violator).has_past_concerts? == false
  end
  
  test "Should downcase the screen name on save or update" do
    band = create_band(:screen_name => 'KrEaToR')
    assert band.save
    
    assert band.screen_name == 'kreator'
  end
  
  test "Should validate de uniqueness of screen name" do
    band1 = create_band(:screen_name => 'screen_name')
    assert band1.save
    
    band2 = create_band(:screen_name => 'screen_name')
    assert band2.save == false
    
    assert_error_on_save band2, :screen_name
  end
  
  test "Should get the last wanted number of posts from the band" do
    band1 = create_band(:screen_name => 'screen_name')
    assert band1.save
    
    create_posts_for_band = lambda { |band|
      post = Post.new
      post.band = band
      post.title = "title"
      post.content = "content"
      assert post.save
    }
    
    (1..10).each do 
      create_posts_for_band.call(band1)
    end
    
    assert band1.posts.size == 10
    
    num = 5
    assert band1.last_posts(num).size == num
  end
  
  test "Should validate format of email" do
    band1 = create_band(:email => "email")
    assert band1.save == false
    
    assert_error_on_save band1, :email  
  end
  
  # Private methods
  private
    def create_band(options = {})
      band_hash = {
        :name => "Kreator",
        :screen_name => 'kreator',
        :genre => genres(:thrash),
        :year => 1983,
        :city => "Essen",
        :country => countries(:germany),
        :about => "About Kreator...",
        :email => "contact@kreator.de",
        :telephone => "(55) 61 34567656",
        :address => "SHIN QI 04 conjunto 08 casa 05 - Brasília/DF - Brazil"
      }
      
      band = Band.new(band_hash.merge options)
    end
end
