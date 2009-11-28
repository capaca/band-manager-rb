require 'test_helper'

class GenreTest < ActiveSupport::TestCase
  test "Should save a genre" do
    genre = Genre.new :title => "Grind"
    
    assert_difference "Genre.count" do
      genre.save
    end
  end
  
  test "Should destroy a genre" do
    assert_difference "Genre.count", -1 do
      genres(:thrash).destroy
    end
  end
  
  test "Should validate presence of title attribute" do
    genre = Genre.new :title => nil
    
    assert_no_difference "Genre.count" do
      genre.save
    end
    
    assert genre.errors[:title]
  end
  
  test "Should validate uniqueness of title attribute" do
    genre = Genre.new :title => genres(:thrash).title
    
    assert_no_difference "Genre.count" do
      genre.save
    end
    
    assert genre.errors[:title]
  end
end
