require 'test_helper'

class BandsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
    
    assert_not_nil assigns(:bands)
    assert_equal assigns(:bands).size, Band.count
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template :new

    assert_not_nil assigns(:band)

    assert_not_nil assigns(:countries)
    assert_equal assigns(:countries).size, Country.count
    
    assert_not_nil assigns(:genres)
    assert_equal assigns(:genres).size, Genre.count
  end

  test "should create band" do
    assert_difference('Band.count') do
      create_band
    end

    assert_redirected_to edit_band_path(assigns(:band))
  end
  
  test "should not create invalid band" do
    assert_no_difference('Band.count') do
      create_band :name => nil
    end

    assert_response :ok
    assert_template :new
    assert_not_nil assigns(:countries)
    assert_not_nil assigns(:genres)
  end

  test "should show band" do
    get :show, :id => bands(:violator).to_param
    assert_response :success
    assert_template :show
  end

  test "should get edit" do
    get :edit, :id => bands(:violator).to_param
    assert_response :success
    assert_template :edit
  end

  test "should update band" do
    post :update, :id => bands(:violator).to_param, 
        :band => {:name => "Outro"}
        
    assert_not_nil assigns(:band)
    assert_redirected_to edit_band_path(assigns(:band))
  end
  
  test "should not update invalid band" do
    put :update, :id => bands(:violator).to_param, :band => {:name => nil}
    assert_response :ok
    assert_template :edit
    assert_not_nil assigns(:countries)
    assert_not_nil assigns(:genres)
  end

  test "should destroy band" do
    assert_difference('Band.count', -1) do
      delete :destroy, :id => bands(:violator).to_param
    end

    assert_redirected_to bands_path
  end
  
  private 
    def create_band(options = {})
      band_hash = {
        :name => "Kreator", 
        :genre => genres(:thrash),
        :year => 1983,
        :city => "Essen",
        :country => countries(:germany),
        :about => "About Kreator..."
      }
      
      post :create, :band => band_hash.merge(options)
    end
  
end














