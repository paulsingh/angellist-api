require 'spec_helper'

describe AngellistApi::Client::Startups do
  before(:each) do
    @client = AngellistApi::Client.new
  end
  
  describe "#get_startup" do
    it "should get 1/startups/<id>" do
      id = "123"
      @client.expects(:get).with("1/startups/#{id}", :format => :json, :phoenix => true).returns("success")
      @client.get_startup(id).should == "success"
    end
  end
  
  describe "#startup_search" do
    it "should get 1/startups/search" do
      options = { :some => "options" }
      @client.expects(:get).with("1/startups/search", options, :format => :json, :phoenix => true).returns("success")
      @client.startup_search(options).should == "success"
    end
  end
end