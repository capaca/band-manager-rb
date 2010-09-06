require 'test_helper'

class Admin::ConfigurationControllerTest < ActionController::TestCase

  test "should get edit" do
    sign_in_with 'user'
    
    get :edit
    assert_response :success
    assert_template :edit
    
    band = assigns(:band)
    assert_not_nil band
  end
end














