require 'spec_helper'

describe "/teste_models/edit.html.erb" do
  include TesteModelsHelper

  before(:each) do
    assigns[:teste_model] = @teste_model = stub_model(TesteModel,
      :new_record? => false
    )
  end

  it "renders the edit teste_model form" do
    render

    response.should have_tag("form[action=#{teste_model_path(@teste_model)}][method=post]") do
    end
  end
end
