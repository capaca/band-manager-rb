require 'spec_helper'

describe TesteModelsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/teste_models" }.should route_to(:controller => "teste_models", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/teste_models/new" }.should route_to(:controller => "teste_models", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/teste_models/1" }.should route_to(:controller => "teste_models", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/teste_models/1/edit" }.should route_to(:controller => "teste_models", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/teste_models" }.should route_to(:controller => "teste_models", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/teste_models/1" }.should route_to(:controller => "teste_models", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/teste_models/1" }.should route_to(:controller => "teste_models", :action => "destroy", :id => "1") 
    end
  end
end
