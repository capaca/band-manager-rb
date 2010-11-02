require 'test_helper'

class Admin::CustomStyleControllerTest < ActionController::TestCase

  test "should get edit" do
    user = sign_in_with 'user'
     
    get :edit, :id => bands(:violator).id
    assert_response :success
    assert_template 'site/index'
    
    band = assigns(:band)
    assert_not_nil band
  end
  
  test "should update band's custom style" do
    user = sign_in_with 'user'
     
    violator = bands(:violator) 
    violator.about = "Testannnnndo!"
    assert violator.save
    
    get :update, {:id => bands(:violator).id, :custom_style => "custom_style"}
    assert_redirected_to "http://test.host/admin/custom_style/edit/#{violator.id}"
    
    band = assigns(:band)
    assert_not_nil band
    
    assert band.custom_style == "custom_style"
  end
  
  test "should render edit in case of errors while saving band's custom style" do
    user = sign_in_with 'user'
     
    violator = bands(:violator) 
    violator.about = ""
    assert violator.save(false)
    
    get :update, {:id => bands(:violator).id, :custom_style => "custom_style"}
    assert_response :success
    assert_template 'site/index'
  end

end














