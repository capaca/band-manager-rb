require 'test_helper'

class ConcertsControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "should create concert" do
    assert_difference('Concert.count') do
      post :create, :concert => create_concert_hash
    end

    assert_redirected_to concert_path(assigns(:concert))
  end

  test "should show concert" do
    get :show, :id => concerts(:concert1).id
    assert_response :success
    assert_template :show
  end

  test "should get edit" do
    get :edit, :id => concerts(:concert1).to_param
    assert_response :success
    assert_template :edit
  end

  test "should update concert" do
    put :update, 
      :id => concerts(:concert1).to_param, 
      :concert => create_concert_hash
    
    assert_redirected_to concert_path(assigns(:concert))
  end

  test "should destroy concert" do
    assert_difference('Concert.count', -1) do
      delete :destroy, :id => concerts(:concert1).to_param
    end

    assert_redirected_to concerts_path
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
  end
end
