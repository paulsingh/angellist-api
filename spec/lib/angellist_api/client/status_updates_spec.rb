require 'spec_helper'

describe AngellistApi::Client::StatusUpdates do
  let(:client) { AngellistApi::Client.new }

  describe "#get_status_updates" do
    it "gets 1/status_updates" do
      options = { :some => "options" }
      client.should_receive(:get).with("1/status_updates", options, :format => :json, :phoenix => true).and_return("success")
      client.get_status_updates(options).should == "success"
    end
  end

  describe "#post_status_updates" do
    it "posts to 1/status_updates" do
      options = { :some => "options" }
      client.should_receive(:post).with("1/status_updates", options, :format => :json, :phoenix => true).and_return("success")
      client.post_status_updates(options).should == "success"
    end
  end

  describe "#delete_status_updates" do
    it "deletes 1/status_updates/<id>" do
      id = "123"
      client.should_receive(:delete).with("1/status_updates/#{id}", :format => :json, :phoenix => true).and_return("success")
      client.delete_status_updates(id).should == "success"
    end
  end
end

