require 'test_helper'

class CountriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:countries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create country" do
    assert_difference('Country.count') do
      post :create, :country => {:name => "China"}
    end

    assert_redirected_to country_path(assigns(:country))
  end

  test "should show country" do
    get :show, :id => countries(:brasil).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => countries(:brasil).to_param
    assert_response :success
  end

  test "should update country" do
    put :update, :id => countries(:brasil).to_param, :country => { }
    assert_redirected_to country_path(assigns(:country))
  end

  test "should destroy country" do
    assert_difference('Country.count', -1) do
      delete :destroy, :id => countries(:brasil).to_param
    end

    assert_redirected_to countries_path
  end
end
