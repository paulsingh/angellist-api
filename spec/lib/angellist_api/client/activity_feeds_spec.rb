require 'spec_helper'

describe AngellistApi::Client::ActivityFeeds do
  before(:each) do
    @client = AngellistApi::Client.new
  end
  
  describe "#get_feed" do
    it "should get 1/feed" do
      options = { :some => "options" }
      @client.expects(:get).with("1/feed", options, :format => :json, :phoenix => true).returns("success")
      @client.get_feed(options).should == "success"
    end
  end
  
end