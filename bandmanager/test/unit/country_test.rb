require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  
  test "Should save a country" do
    country = Country.new :name => "Argentina"
    
    assert_difference "Country.count" do
      country.save
    end
  end
  
  test "Should destroy a country" do
    assert_difference "Country.count", -1 do
      countries(:brasil).destroy
    end
  end
  
  test "Should validate presence of name attribute" do
    country = Country.new :name => nil
    
    assert_no_difference "Country.count" do
      country.save
    end
    
    assert country.errors[:name]
  end
  
  test "should validate uniqueness of name attribute" do
    country = Country.new :name => countries(:brasil).name
    
    assert_no_difference "Country.count" do
      country.save
    end
    
    assert country.errors[:name]
  end
end
