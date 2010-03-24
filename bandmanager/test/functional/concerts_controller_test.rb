require 'test_helper'

class ConcertsControllerTest < ActionController::TestCase

  test "should get new" do
    get :new, :band_id => bands(:violator).id
    assert_response :success
    assert_template :new
    
    assert_not_nil assigns(:concert)
    assert_not_nil assigns(:band)
    assert_not_nil assigns(:countries)
  end

  test "should create concert" do
    assert_difference('Concert.count') do
      post :create, :band_id => bands(:violator).id, :concert => create_concert_hash
    end

    assert_redirected_to band_concert_path(assigns(:band), assigns(:concert))

    concert = assigns(:concert)
    concert.reload

    assert_not_nil concert
    assert_not_nil concert.bands
    assert_equal concert.bands.size, 1
         
    assert_equal assigns(:concert).bands[0].id, bands(:violator).id
  end
  
  test "should load coutries if got error on create" do
    assert_no_difference('Concert.count') do
      post :create, 
        :band_id => bands(:violator).id, 
        :concert => create_concert_hash(:date => nil) # Invalid date
    end

    assert_template :new
    assert (not assigns(:concert).errors.empty?)
    
    assert_not_nil assigns(:countries)
  end

  test "should show concert" do
    get :show, :band_id => bands(:violator).id, :id => concerts(:concert1).id
    assert_response :success
    assert_template :show
    
    assert_not_nil assigns(:concert)
    assert_not_nil assigns(:band)
  end

  test "should get edit" do
    get :edit, :band_id => bands(:violator).id, :id => concerts(:concert1).to_param
    assert_response :success
    assert_template :edit
    
    assert_not_nil assigns(:concert)
    assert_not_nil assigns(:band)
    assert_not_nil assigns(:countries)
  end

  test "should update concert" do
    put :update, 
      :band_id => bands(:violator).id,
      :id => concerts(:concert1).to_param, 
      :concert => create_concert_hash
    
    assert_redirected_to band_concert_path(assigns(:band), assigns(:concert))
  end

  test "should destroy concert" do
    assert_difference('Concert.count', -1) do
      delete :destroy, :band_id => bands(:violator).id, :id => concerts(:concert1).to_param
    end

    assert_redirected_to band_path(bands(:violator))
  end
  
  # Private methods
  private
  
  def create_concert_hash(options = {})
    concert_hash = {
      :name => 'Total Thrashin\' Concert',
      :date => Time.new,
      :city => 'Brasília',
      :region => 'DF',
      :country_id => countries(:brasil).id,
      :details => 'Detalhes do show'
    }
    
    concert_hash.merge options
  end
end
