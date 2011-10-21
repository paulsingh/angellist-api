require 'spec_helper'

describe AngellistApi::Client::Reviews do
  before(:each) do
    @client = AngellistApi::Client.new
  end
  
  describe "#get_reviews" do
    it "should get 1/reviews" do
      options = { :some => "options" }
      @client.expects(:get).with("1/reviews", options, :format => :json, :phoenix => true).returns("success")
      @client.get_reviews(options).should == "success"
    end
  end
  
end