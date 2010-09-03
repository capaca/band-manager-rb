require 'test_helper'

class ConfigurationTest < ActiveSupport::TestCase
  
  test "should get an empty configuration" do
    conf = Configuration.instance
    assert conf != nil
    assert conf.band == nil
  end
  
  test "should get an existing configuration" do
    params = {
      :band => bands(:violator)
    }
    
    conf = Configuration.setup params

    assert conf != nil
    assert conf.band != nil
    assert conf.band.id = bands(:violator).id
  end
  
  test "should not let create a new configuration" do
    assert_raise NoMethodError do
      Configuration.new
    end
  end
  
  private 
  
  def setup_config
    params = {
      :band => bands(:violator)
    }
    
    Configuration.setup params
  end 
end


















