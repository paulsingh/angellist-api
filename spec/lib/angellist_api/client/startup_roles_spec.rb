require 'spec_helper'

describe AngellistApi::Client::StartupRoles do
  before(:each) do
    @client = AngellistApi::Client.new
  end
  
  describe "#get_startup_roles" do
    it "should get to 1/follows" do
      options = { :some => "options" }
      @client.expects(:get).with("1/startup_roles", options, :format => :json, :phoenix => true).returns("success")
      @client.get_startup_roles(options).should == "success"
    end
  end
  
end