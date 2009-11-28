require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  
  test "Should save a country" do
    country = Country.new :name => "Brasil"
    
    assert_difference "Country.count" do
      country.save
    end
  end
  
  test "Should destroy a country" do
    country = Country.new :name => "Brasil"
    country.save
    
    assert_difference "Country.count", -1 do
      country.destroy
    end
  end
  
  test "Should validate presence of name attribute" do
    country = Country.new :name => nil
    
    assert_no_difference "Country.count" do
      country.save
    end
    
    assert country.errors
  end
end
