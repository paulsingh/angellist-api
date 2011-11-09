require 'spec_helper'

describe AngellistApi::Request do
  class DummyRequest; include AngellistApi::Request; end
  
  before(:each) do
    @dummy = DummyRequest.new
    @sample_path = "/index"
    @sample_params = { :sample => "params" }
    @sample_options = { :sample => "options" }
  end
  
  describe "#get" do
    it "should call request with the passed params" do
      @dummy.expects(:request).with(:get, @sample_path, @sample_params, @sample_options).returns("result")
      @dummy.get(@sample_path, @sample_params, @sample_options).should == "result"
    end
  end
  
  describe "#post" do
    it "should call request with the passed params" do
      @dummy.expects(:request).with(:post, @sample_path, @sample_params, @sample_options).returns("result")
      @dummy.post(@sample_path, @sample_params, @sample_options).should == "result"
    end
  end
  
  describe "#put" do
    it "should call request with the passed params" do
      @dummy.expects(:request).with(:put, @sample_path, @sample_params, @sample_options).returns("result")
      @dummy.put(@sample_path, @sample_params, @sample_options).should == "result"
    end
  end
  
  describe "#delete" do
    it "should call request with the passed params" do
      @dummy.expects(:request).with(:delete, @sample_path, @sample_params, @sample_options).returns("result")
      @dummy.delete(@sample_path, @sample_params, @sample_options).should == "result"
    end
  end
  
  describe "#formatted_path" do
    it "should return a string with the path without the given format appended" do
      @dummy.send(:formatted_path, @sample_path, {:format => 'json'}).should == "/index"
    end
    
    it "should not throw an error options[:format] is not provided" do
      lambda { @dummy.send(:formatted_path, @sample_path) }.should_not raise_error
    end
  end
  
end