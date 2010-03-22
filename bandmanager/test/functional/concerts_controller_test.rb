require 'test_helper'

class ConcertsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:concerts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create concert" do
    assert_difference('Concert.count') do
      post :create, :concert => { }
    end

    assert_redirected_to concert_path(assigns(:concert))
  end

  test "should show concert" do
    get :show, :id => concerts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => concerts(:one).to_param
    assert_response :success
  end

  test "should update concert" do
    put :update, :id => concerts(:one).to_param, :concert => { }
    assert_redirected_to concert_path(assigns(:concert))
  end

  test "should destroy concert" do
    assert_difference('Concert.count', -1) do
      delete :destroy, :id => concerts(:one).to_param
    end

    assert_redirected_to concerts_path
  end
end
