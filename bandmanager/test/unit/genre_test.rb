require 'test_helper'

class GenreTest < ActiveSupport::TestCase
  test "Should save a genre" do
    genre = Genre.new :title => "Thrash Metal"
    
    assert_difference "Genre.count" do
      genre.save
    end
  end
  
  test "Should destroy a genre" do
    genre = Genre.new :title => "Thrash Metal"
    genre.save
    
    assert_difference "Genre.count", -1 do
      genre.destroy
    end
  end
  
  test "Should validate presence of title attribute" do
    genre = Genre.new :title => nil
    
    assert_no_difference "Genre.count" do
      genre.save
    end
    
    assert genre.errors
  end
end
