require 'test_helper'

class SongTest < ActiveSupport::TestCase
  
  test "Should save a song" do
    song = create_song
    assert_difference "Song.count" do
      song.save
    end
  end

  test "Should destroy a song" do
    song = create_song
    song.save
    
    assert_difference "Song.count", -1 do
      song.destroy
    end
  end
  
  test "Should validate presence of attributes" do
    song = Song.new
    assert_error_on_save song, :title, :track_number, :release_id
  end

  test "Should validate association with a valid release" do
    song = create_song(:release => Release.new) # Invalid release (empty)
    assert_error_on_save song, :release
  end
  
  test "Should not save a song with the same track number in the release scope" do
    assert create_song(:track_number => 1).save
    
    song = create_song(:track_number => 1)
    assert song.save == false
    assert song.errors.empty? == false
    assert song.errors[:track_number].empty? == false
    
    song = create_song(:release => releases(:violent_mosh), :track_number => 1)
    assert song.save
  end
  
  # Private methods
  private
  
  def create_song(options = {})
    song_hash = {
      :title => 'Atomic Nightmare',
      :track_number => 1,
      :lyrics => 'Letras',
      :release => releases(:chemical_assault)      
    }
    
    Song.new(song_hash.merge options)
  end

end
