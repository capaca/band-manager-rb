require 'spec_helper'

describe TesteModelsController do

  def mock_teste_model(stubs={})
    @mock_teste_model ||= mock_model(TesteModel, stubs)
  end

  describe "GET index" do
    it "assigns all teste_models as @teste_models" do
      TesteModel.stub!(:find).with(:all).and_return([mock_teste_model])
      get :index
      assigns[:teste_models].should == [mock_teste_model]
    end
  end

  describe "GET show" do
    it "assigns the requested teste_model as @teste_model" do
      TesteModel.stub!(:find).with("37").and_return(mock_teste_model)
      get :show, :id => "37"
      assigns[:teste_model].should equal(mock_teste_model)
    end
  end

  describe "GET new" do
    it "assigns a new teste_model as @teste_model" do
      TesteModel.stub!(:new).and_return(mock_teste_model)
      get :new
      assigns[:teste_model].should equal(mock_teste_model)
    end
  end

  describe "GET edit" do
    it "assigns the requested teste_model as @teste_model" do
      TesteModel.stub!(:find).with("37").and_return(mock_teste_model)
      get :edit, :id => "37"
      assigns[:teste_model].should equal(mock_teste_model)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created teste_model as @teste_model" do
        TesteModel.stub!(:new).with({'these' => 'params'}).and_return(mock_teste_model(:save => true))
        post :create, :teste_model => {:these => 'params'}
        assigns[:teste_model].should equal(mock_teste_model)
      end

      it "redirects to the created teste_model" do
        TesteModel.stub!(:new).and_return(mock_teste_model(:save => true))
        post :create, :teste_model => {}
        response.should redirect_to(teste_model_url(mock_teste_model))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved teste_model as @teste_model" do
        TesteModel.stub!(:new).with({'these' => 'params'}).and_return(mock_teste_model(:save => false))
        post :create, :teste_model => {:these => 'params'}
        assigns[:teste_model].should equal(mock_teste_model)
      end

      it "re-renders the 'new' template" do
        TesteModel.stub!(:new).and_return(mock_teste_model(:save => false))
        post :create, :teste_model => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested teste_model" do
        TesteModel.should_receive(:find).with("37").and_return(mock_teste_model)
        mock_teste_model.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :teste_model => {:these => 'params'}
      end

      it "assigns the requested teste_model as @teste_model" do
        TesteModel.stub!(:find).and_return(mock_teste_model(:update_attributes => true))
        put :update, :id => "1"
        assigns[:teste_model].should equal(mock_teste_model)
      end

      it "redirects to the teste_model" do
        TesteModel.stub!(:find).and_return(mock_teste_model(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(teste_model_url(mock_teste_model))
      end
    end

    describe "with invalid params" do
      it "updates the requested teste_model" do
        TesteModel.should_receive(:find).with("37").and_return(mock_teste_model)
        mock_teste_model.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :teste_model => {:these => 'params'}
      end

      it "assigns the teste_model as @teste_model" do
        TesteModel.stub!(:find).and_return(mock_teste_model(:update_attributes => false))
        put :update, :id => "1"
        assigns[:teste_model].should equal(mock_teste_model)
      end

      it "re-renders the 'edit' template" do
        TesteModel.stub!(:find).and_return(mock_teste_model(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested teste_model" do
      TesteModel.should_receive(:find).with("37").and_return(mock_teste_model)
      mock_teste_model.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the teste_models list" do
      TesteModel.stub!(:find).and_return(mock_teste_model(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(teste_models_url)
    end
  end

end
