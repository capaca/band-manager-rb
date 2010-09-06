require 'test_helper'

class SiteControllerTest < ActionController::TestCase
  test "should get index and load the configured band" do
    Configuration.setup(bands(:violator))
    
    get :index
    assert_response :success
    assert_template :index
    
    band = assigns(:band)
    assert_not_nil band
    assert band.id == Configuration.band.id
  end
  
  test "should get index and load the band by screen_name" do
    get :index, :screen_name => bands(:violator).screen_name
    assert_response :success
    assert_template :index
    
    band = assigns(:band)
    assert_not_nil band
    assert band.id == bands(:violator).id
  end
  
  test "should get index and render error page with no configured band and no screen name informed" do
    get :index # no screen name
    assert_response :error
    assert_template 'errors/error.html.erb'
  end 
end
