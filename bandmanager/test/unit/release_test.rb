require 'test_helper'

class ReleaseTest < ActiveSupport::TestCase
  
  test "Should save a release" do
    release = create_release
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
    release = Release.new
    assert_error_on_save release, :title, :year, :band, :type_id
  end
  
  test "Should validate association with a valid band" do
    release = create_release(:band => Band.new) #Creates a release with a invalid band
    assert_error_on_save release, :band
  end
  
  test "Should validate the length of details" do
    release = create_release(:details => 'abc') # Details lenth = 3 chars
    assert_error_on_save release, :details
  end
  
  test "Should validate numericality of year" do
    release = create_release(:year => 'abc') # Not a number
    assert_error_on_save release, :year
  end

  test "Should validate the year greater than the year of the band" do
    release = create_release(
      :year => bands(:violator).year-1 # Year greater than the year of the band
    ) 
    assert_error_on_save release, :year
  end

  test "Should validate the year less or equal than the current year" do
    release = create_release(:year => Time.new.year+1) # Year after the current year
    assert_error_on_save release, :year
  end
  
  # Private methods
  private
 
  def create_release(options = {})
    release_hash = {
      :band => bands(:violator),
      :type_id => release_types(:cd).to_param,
      :title => 'Chemical Assault',
      :year => 2006,
      :details => 'Detalhes do CD',
    }
    
    Release.new(release_hash.merge options)
  end
end
