require 'spec_helper'

describe TesteModel do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    TesteModel.create!(@valid_attributes)
  end
end
