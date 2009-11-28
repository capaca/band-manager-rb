require 'test_helper'

class GenresControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:genres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create genre" do
    assert_difference('Genre.count') do
      post :create, :genre => {:title => "Grind"}
    end

    assert_redirected_to genres_path
  end
  
  test "should destroy genre" do
    assert_difference('Genre.count', -1) do
      delete :destroy, :id => genres(:thrash).to_param
    end

    assert_redirected_to genres_path
  end
end
