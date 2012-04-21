require 'spec_helper'

describe AngellistApi::Client::ActivityFeeds do
  let(:client) { AngellistApi::Client.new }

  describe "#get_feed" do
    it "gets 1/feed" do
      options = { :some => "options" }
      client.should_receive(:get).with("1/feed", options, :format => :json).and_return("success")
      client.get_feed(options).should == "success"
    end
  end
end

