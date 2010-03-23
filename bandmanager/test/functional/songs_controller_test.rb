require 'test_helper'

class SongsControllerTest < ActionController::TestCase

  test "should show song" do
    get :show, :id => songs(:atomic_nightmare).id
    
    assert_response :success
    assert_template :show
    
    assert_not_nil assigns(:song)
  end

  test "should get new" do
    get :new, :release_id => releases(:chemical_assault).id
    assert_response :success
    assert_template :new
    
    assert_not_nil assigns(:band)
    assert_not_nil assigns(:release)
    assert_not_nil assigns(:song)
  end

  test "should get edit" do
    get :edit, 
      :release_id => songs(:atomic_nightmare).release_id, 
      :id => songs(:atomic_nightmare).id
    
    assert_response :success
    assert_template :edit
    
    assert_not_nil assigns(:band)
    assert_not_nil assigns(:release)
    assert_not_nil assigns(:song)

  end

  test "should create song" do
    assert_difference('Song.count') do
      post :create, 
        :release_id => releases(:chemical_assault),
       :song => create_song_hash
    end

    song = assigns(:song)
    release = assigns(:release)
    band = assigns(:band)
    
    assert_not_nil song
    assert_not_nil release
    assert_not_nil band
    
    assert_redirected_to edit_band_release_song_path(band,release,song)
  end

  test "should not create an invalid song" do
    assert_no_difference('Song.count') do
      post :create, 
        :release_id => releases(:chemical_assault),
       :song => create_song_hash(:title => nil)
    end

    song = assigns(:song)
    release = assigns(:release)
    band = assigns(:band)
    
    assert_not_nil song
    assert_not_nil release
    assert_not_nil band
    
    assert_template :new
  end

  test "should update song" do
    put :update, :id => songs(:atomic_nightmare).id, :song => create_song_hash
    assert_redirected_to band_path(assigns(:song).release.band)
  end

  test "should not update an invalid song" do
    put :update, 
      :id => songs(:atomic_nightmare).id, 
      :song => create_song_hash(:title => nil)
      
    assert_template(:edit)
    assert_not_nil assigns(:band)
    assert_not_nil assigns(:release)
    assert_not_nil assigns(:song)
  end

  test "should destroy song" do
    assert_difference('Song.count', -1) do
      delete :destroy, :id => songs(:atomic_nightmare).id
    end

    band = songs(:atomic_nightmare).release.band
    release = songs(:atomic_nightmare).release

    assert_redirected_to band_path(band)
  end
  
  # Private Methods
  private
  
  def create_song_hash(options = {})
    song_hash = {
      :title => 'Atomic Nightmare',
      :track_number => 1,
      :lyrics => 'Letra de atomic nightmare',
      :time => '03:00'    
    }
    
    song_hash.merge options
  end
end
