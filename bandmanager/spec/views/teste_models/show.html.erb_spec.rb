require 'spec_helper'

describe "/teste_models/show.html.erb" do
  include TesteModelsHelper
  before(:each) do
    assigns[:teste_model] = @teste_model = stub_model(TesteModel)
  end

  it "renders attributes in <p>" do
    render
  end
end
