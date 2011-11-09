require 'spec_helper'

describe AngellistApi::Client::Tags do
  before(:each) do
    @client = AngellistApi::Client.new
  end
  
  describe "#get_tag" do
    it "should get 1/tags/<id>" do
      id = "123"
      @client.expects(:get).with("1/tags/#{id}", :format => :json, :phoenix => true).returns("success")
      @client.get_tag(id).should == "success"
    end
  end
  
  describe "#get_tag_children" do
    it "should get 1/tags/<id>/children" do
      id = "123"
      @client.expects(:get).with("1/tags/#{id}/children", :format => :json, :phoenix => true).returns("success")
      @client.get_tag_children(id).should == "success"
    end
  end
  
  describe "#get_tag_parents" do
    it "should get 1/tags/<id>/parents" do
      id = "123"
      @client.expects(:get).with("1/tags/#{id}/parents", :format => :json, :phoenix => true).returns("success")
      @client.get_tag_parents(id).should == "success"
    end
  end
  
  describe "#get_tag_startups" do
    it "should get 1/tags/<id>/startups" do
      id = "123"
      options = { :some => "options" }
      @client.expects(:get).with("1/tags/#{id}/startups", options, :format => :json, :phoenix => true).returns("success")
      @client.get_tag_startups(id, options).should == "success"
    end
  end
end