require 'test_helper'

class ReleasesControllerTest < ActionController::TestCase

  test "should get new" do
    get :new, :band_id => bands(:violator).id
    assert_response :success
    assert_template :new
    
    assert_not_nil assigns(:band)
    assert_not_nil assigns(:release)
    assert_not_nil assigns(:types)
  end

  test "should get edit" do
    get :edit, :id => releases(:chemical_assault).to_param
    assert_response :success
    assert_template :edit
    
    assert_not_nil assigns(:band)
    assert_not_nil assigns(:release)
    assert_not_nil assigns(:types)
  end

  test "should create release" do
    assert_difference('Release.count') do
      post :create, :band_id => bands(:violator).id, :release => create_release_hash
    end

    assert_redirected_to band_path(assigns(:band), :anchor => 'releases')
  end
  
  test "should not create an invalid release" do
    assert_no_difference('Release.count') do
      post :create, 
        :band_id => bands(:violator).id, 
        :release => create_release_hash(:title => nil)
    end

    assert_template :new
  end

  test "should update release" do
    put :update, 
      :id => releases(:chemical_assault).id, 
      :release => create_release_hash
    
    assert_redirected_to edit_band_release_path(assigns(:release).band, assigns(:release))
  end
  
  test "should not update an invalid release" do
    put :update, 
      :id => releases(:chemical_assault).id, 
      :release => create_release_hash(:title => nil)
    
    assert_template :edit
    assert_not_nil assigns(:band)
    assert_not_nil assigns(:types)
  end

  test "should destroy release" do
    assert_difference('Release.count', -1) do
      delete :destroy, :id => releases(:chemical_assault).to_param
    end

    assert_redirected_to band_path(releases(:chemical_assault).band)
  end
  
  # Private methods
  private
 
  def create_release_hash(options = {})
    release_hash = {
      :type_id => release_types(:cd).to_param,
      :title => 'Chemical Assault',
      :year => 2006,
      :details => 'Detalhes do CD',
    }
    
    release_hash.merge options
  end
end
