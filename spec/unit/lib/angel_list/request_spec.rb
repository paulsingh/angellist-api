require 'spec_helper'

describe AngelList::Request do
  class DummyRequest; include AngelList::Request; end

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

  describe "#delete" do
    it "calls request with the passed params" do
      dummy.should_receive(:request).with(:delete, sample_path, sample_params, sample_options).and_return("result")
      dummy.delete(sample_path, sample_params, sample_options).should == "result"
    end
  end
end

