require 'spec_helper'

describe AngellistApi::Client::Startups do
  let(:client) { AngellistApi::Client.new }

  describe "#get_startup" do
    it "gets 1/startups/<id>" do
      id = "123"
      client.should_receive(:get).with("1/startups/#{id}").and_return("success")
      client.get_startup(id).should == "success"
    end
  end

  describe "#startup_search" do
    it "gets 1/startups/search" do
      options = { :some => "options" }
      client.should_receive(:get).with("1/startups/search", options).and_return("success")
      client.startup_search(options).should == "success"
    end
  end
end

