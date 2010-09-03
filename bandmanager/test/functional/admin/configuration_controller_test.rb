require 'test_helper'

class Admin::ConfigurationControllerTest < ActionController::TestCase
  
  include Devise::TestHelpers
  
  test "should get index" do
    user = create_user 'admin'
    assert user != nil
    sign_in :user, user
    
    get :index
    assert_response :success
    assert_template :index
    
    bands = assigns(:bands)
    assert_not_nil bands
    bands.size == Band.count
  end
  
  test "should update the configuration" do
    params = {
      :mode => "one",
      :band_id => bands(:violator).id
    }
    
    post :update, params
    assert_response :success
    assert_template :index
  end
end














