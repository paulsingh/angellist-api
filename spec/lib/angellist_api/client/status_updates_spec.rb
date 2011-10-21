require 'spec_helper'

describe AngellistApi::Client::StatusUpdates do
  before(:each) do
    @client = AngellistApi::Client.new
  end
  
  describe "#get_status_updates" do
    it "should get 1/status_updates" do
      options = { :some => "options" }
      @client.expects(:get).with("1/status_updates", options, :format => :json, :phoenix => true).returns("success")
      @client.get_status_updates(options).should == "success"
    end
  end
  
  describe "#post_status_updates" do
    it "should post to 1/status_updates" do
      options = { :some => "options" }
      @client.expects(:post).with("1/status_updates", options, :format => :json, :phoenix => true).returns("success")
      @client.post_status_updates(options).should == "success"
    end
  end
  
  describe "#delete_status_updates" do
    it "should delete 1/status_updates/<id>" do
      id = "123"
      @client.expects(:delete).with("1/status_updates/#{id}", :format => :json, :phoenix => true).returns("success")
      @client.delete_status_updates(id).should == "success"
    end
  end
  
end