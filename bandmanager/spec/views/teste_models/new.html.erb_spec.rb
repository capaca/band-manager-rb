require 'spec_helper'

describe "/teste_models/new.html.erb" do
  include TesteModelsHelper

  before(:each) do
    assigns[:teste_model] = stub_model(TesteModel,
      :new_record? => true
    )
  end

  it "renders new teste_model form" do
    render

    response.should have_tag("form[action=?][method=post]", teste_models_path) do
    end
  end
end
