require 'spec_helper'

describe "/teste_models/index.html.erb" do
  include TesteModelsHelper

  before(:each) do
    assigns[:teste_models] = [
      stub_model(TesteModel),
      stub_model(TesteModel)
    ]
  end

  it "renders a list of teste_models" do
    render
  end
end
