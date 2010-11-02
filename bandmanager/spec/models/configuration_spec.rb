require 'test_helper'

class ConfigurationTest < ActiveSupport::TestCase
  
  def setup
    Configuration.delete_all
  end
  
  test "should get an empty configuration" do
    conf = Configuration.instance
    assert conf != nil
    assert conf.band == nil
  end
  
  test "should setup the configuration with a band" do
    Configuration.setup bands(:violator)
    conf = Configuration.instance
    
    assert_not_nil conf
    assert_not_nil conf.band_id
    assert conf.band.id == bands(:violator).id
  end
  
  test "should setup the configuration empty" do
    conf = Configuration.setup

    assert conf != nil
    assert_nil conf.band
  end
  
  test "should not let create a new configuration" do
    assert_raise NoMethodError do
      Configuration.new
    end
  end
  
  test "should not update an configuration instance" do
    conf = Configuration.instance
    assert_raise NoMethodError do
      conf.update(:band => bands(:violator))
    end
  end
  
  test "should not destroy an configuration instance" do
    conf = Configuration.instance
    assert_raise NoMethodError do
      conf.destroy
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


















