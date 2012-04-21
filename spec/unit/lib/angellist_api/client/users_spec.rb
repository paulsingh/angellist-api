require 'spec_helper'

describe AngellistApi::Client::Users do
  let(:client) { AngellistApi::Client.new }

  describe "#get_user" do
    it "gets 1/users/<id>" do
      id = "123"
      client.should_receive(:get).with("1/users/#{id}", :format => :json).and_return("success")
      client.get_user(id).should == "success"
    end
  end

  describe "#user_search" do
    it "gets 1/users/search" do
      options = { :some => "options "}
      client.should_receive(:get).with("1/users/search", options, :format => :json).and_return("success")
      client.user_search(options).should == "success"
    end
  end

  describe "#me" do
    it "gets 1/me" do
      client.should_receive(:get).with("1/me", :format => :json).and_return("success")
      client.me.should == "success"
    end
  end
end

