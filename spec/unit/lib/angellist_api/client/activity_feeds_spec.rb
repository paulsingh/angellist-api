require 'spec_helper'

describe AngellistApi::Client::ActivityFeeds do
  let(:client) { AngellistApi::Client.new }

  describe "#get_feed" do
    it "gets 1/feed" do
      options = { :some => "options" }
      client.should_receive(:get).with("1/feed", options).and_return("success")
      client.get_feed(options).should == "success"
    end
  end

  describe '#feed_item' do
    it 'gets 1/feed/<id>' do
      id = '8fCC3'
      client.should_receive(:get).with("1/feed/#{id}").and_return('success')
      client.feed_item(id).should eq 'success'
    end
  end
end

