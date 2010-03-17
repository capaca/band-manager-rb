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
  
#  test "Should validate association with a valid band"
#  
#  test "Should validate the length of details"
#  
#  test "Should validate numericality of year"

#  test "Should validate the year greater than the year of the band"

#  test "Should validate the year less than the current year"
  
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
