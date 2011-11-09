require 'spec_helper'

describe AngellistApi::Client::Users do
  before(:each) do
    @client = AngellistApi::Client.new
  end
  
  describe "#get_user" do
    it "should get 1/users/<id>" do
      id = "123"
      @client.expects(:get).with("1/users/#{id}", :format => :json, :phoenix => true).returns("success")
      @client.get_user(id).should == "success"
    end
  end
  
  describe "#user_search" do
    it "should get 1/users/search" do
      options = { :some => "options "}
      @client.expects(:get).with("1/users/search", options, :format => :json, :phoenix => true).returns("success")
      @client.user_search(options).should == "success"
    end
  end
  
  describe "#me" do
    it "should get 1/me" do
      @client.expects(:get).with("1/me", :format => :json, :phoenix => true).returns("success")
      @client.me.should == "success"
    end
  end
end