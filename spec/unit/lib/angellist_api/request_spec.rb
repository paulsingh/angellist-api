require 'spec_helper'

describe AngellistApi::Request do
  class DummyRequest; include AngellistApi::Request; end

  let(:dummy) { DummyRequest.new }
  let(:sample_path) { "/index" }
  let(:sample_params) { { :sample => "params" } }
  let(:sample_options) { { :sample => "options" } }

  describe "#get" do
    it "calls request with the passed params" do
      dummy.should_receive(:request).with(:get, sample_path, sample_params, sample_options).and_return("result")
      dummy.get(sample_path, sample_params, sample_options).should == "result"
    end
  end

  describe "#post" do
    it "calls request with the passed params" do
      dummy.should_receive(:request).with(:post, sample_path, sample_params, sample_options).and_return("result")
      dummy.post(sample_path, sample_params, sample_options).should == "result"
    end
  end

  describe "#put" do
    it "calls request with the passed params" do
      dummy.should_receive(:request).with(:put, sample_path, sample_params, sample_options).and_return("result")
      dummy.put(sample_path, sample_params, sample_options).should == "result"
    end
  end

  describe "#delete" do
    it "calls request with the passed params" do
      dummy.should_receive(:request).with(:delete, sample_path, sample_params, sample_options).and_return("result")
      dummy.delete(sample_path, sample_params, sample_options).should == "result"
    end
  end

  describe "#formatted_path" do
    it "returns a string with the path without the given format appended" do
      dummy.send(:formatted_path, sample_path, {:format => 'json'}).should == "/index"
    end

    it "does not throw an error options[:format] is not provided" do
      expect { dummy.send(:formatted_path, sample_path) }.not_to raise_error
    end
  end
end

