require 'test_helper'

class Admin::ConfigurationControllerTest < ActionController::TestCase
  
  include Devise::TestHelpers
  
  def setup
    Configuration.delete_all
  end
  
  test "should get edit" do
    user = create_user 'admin'
    sign_in :user, user
    
    get :edit
    assert_response :success
    assert_template :edit
    
    bands = assigns(:bands)
    configuration = assigns(:configuration)
    assert_not_nil bands
    assert_not_nil configuration
    
    bands.size == Band.count
  end
  
  test "should update the configuration setting a band" do
    user = create_user 'admin'
    sign_in :user, user
    
    post :update, :band_id => bands(:violator).id
    assert_redirected_to :action => :edit
    
    conf = Configuration.instance
    assert_not_nil conf
    assert_not_nil conf.band    
  end
  
  test "should update the configuration setting no band" do
    user = create_user 'admin'
    sign_in :user, user
    
    post :update
    assert_redirected_to :action => :edit
    
    conf = Configuration.instance
    assert_not_nil conf
    assert_nil conf.band    
  end
end














