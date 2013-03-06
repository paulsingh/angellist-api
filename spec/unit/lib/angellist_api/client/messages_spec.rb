require 'spec_helper'

describe AngellistApi::Client::Messages do
  let(:client) { AngellistApi::Client.new }

  describe "#get_messages" do
    it "gets 1/messages" do
      options = { :some => "options" }
      client.should_receive(:get).with("1/messages", options).and_return("success")
      client.get_messages(options).should == "success"
    end
  end

  describe "#post_messages" do
    it "posts to 1/messages" do
      options = { :some => "options" }
      client.should_receive(:post).with("1/messages", options).and_return("success")
      client.post_messages(options).should == "success"
    end
  end
  
end

