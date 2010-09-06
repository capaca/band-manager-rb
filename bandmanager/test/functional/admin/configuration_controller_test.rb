require 'test_helper'

class Admin::ConfigurationControllerTest < ActionController::TestCase

  test "should get edit" do
    sign_in_with 'admin'
        
    get :edit
    assert_response :success
    assert_template :edit
    
    bands = assigns(:bands)
    configuration = assigns(:configuration)
    assert_not_nil bands
    assert_not_nil configuration
    
    bands.size == Band.count
  end
  
  test "should not get edit in case of no user signed in" do
    get :edit
    assert_redirected_to "http://test.host/users/sign_in?unauthenticated=true"
  end 
  
  test "should not get edit in case of signed in without the admin role" do
    sign_in_with 'user'
    get :edit
    assert_response :forbidden
  end 
  
  test "should update the configuration setting a band" do
    sign_in_with 'admin'
    
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
  
  test "should not update configuration in case of no user signed in" do
    get :update
    assert_redirected_to "http://test.host/users/sign_in?unauthenticated=true"
  end
  
  test "should not uptade the configuration in case of signed in without the admin role" do
    sign_in_with 'user'
    get :update
    assert_response :forbidden
  end 

end














