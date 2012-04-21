require 'spec_helper'

describe AngellistApi::Client::Tags do
  let(:client) { AngellistApi::Client.new }

  describe "#get_tag" do
    it "gets 1/tags/<id>" do
      id = "123"
      client.should_receive(:get).with("1/tags/#{id}", :format => :json).and_return("success")
      client.get_tag(id).should == "success"
    end
  end

  describe "#get_tag_children" do
    it "gets 1/tags/<id>/children" do
      id = "123"
      client.should_receive(:get).with("1/tags/#{id}/children", :format => :json).and_return("success")
      client.get_tag_children(id).should == "success"
    end
  end

  describe "#get_tag_parents" do
    it "gets 1/tags/<id>/parents" do
      id = "123"
      client.should_receive(:get).with("1/tags/#{id}/parents", :format => :json).and_return("success")
      client.get_tag_parents(id).should == "success"
    end
  end

  describe "#get_tag_startups" do
    it "gets 1/tags/<id>/startups" do
      id = "123"
      options = { :some => "options" }
      client.should_receive(:get).with("1/tags/#{id}/startups", options, :format => :json).and_return("success")
      client.get_tag_startups(id, options).should == "success"
    end
  end
end

