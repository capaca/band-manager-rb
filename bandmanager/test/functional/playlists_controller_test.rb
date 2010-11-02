require 'test_helper'

class PlaylistsControllerTest < ActionController::TestCase
  test "deveria carregar o play list de uma banda" do
    
    song1 = songs(:atomic_nightmare)
    song1.audio = File.new(RAILS_ROOT + '/test/fixtures/audios/audio.mp3')

    assert song1.save, song1.errors.inspect
    assert song1.audio.exists?
    
    get :load, :id => bands(:violator).id
    assert_response :success
  end
end
