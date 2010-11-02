require File.dirname(__FILE__) + "/spec_helper"

describe Aegis::Loader do

  describe 'paths' do

    it "should return all paths in the lib folder" do

      root = "#{File.dirname(__FILE__)}/../lib/"
      Dir["#{root}*/*.rb"].collect do |file|
        path = file.sub(root, "").sub(/\.rb$/, "")
        Aegis::Loader.paths.should include(path) unless path == 'aegis/loader'
      end

    end

  end

  describe 'load_paths' do

    it "should require all paths" do

      Aegis::Loader.stub(:paths => ['one', 'two'])
      Aegis::Loader.should_receive(:require).with('one')
      Aegis::Loader.should_receive(:require).with('two')
      Aegis::Loader.load_paths

    end

  end

  describe 'loaded?' do

    it "should be loaded by the time this test runs" do
      Aegis::Loader.should be_loaded
    end

  end

end