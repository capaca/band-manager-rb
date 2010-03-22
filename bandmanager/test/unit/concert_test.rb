require 'test_helper'

class ConcertTest < ActiveSupport::TestCase

  test "Should save a concert" do
    concert = create_concert
    
    assert_difference "Concert.count" do
      concert.save
    end    
  end
  
  test "Should destroy a concert" do
    concert = create_concert
    concert.save
    
    assert_difference "Concert.count", -1 do
      concert.destroy
    end    
  end
  
  test "Should validate presence of attributes" do
    concert = Concert.new
    
    assert_no_difference "Concert.count" do
      assert_error_on_save concert, :name, :date, :city, :country_id
    end
  end
  
  # Private methods
  private
  
  def create_concert(options = {})
    concert_hash = {
      :name => 'Total Thrashin\' Concert',
      :date => Time.new,
      :city => 'Brasília',
      :region => 'DF',
      :country_id => countries(:brasil),
      :details => 'Detalhes do show'
    }
    
    Concert.new concert_hash.merge options
  end
end
