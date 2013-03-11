require 'spec_helper'

describe AngelList::Client::Reviews do
  let(:client) { AngelList::Client.new }

  describe "#get_reviews" do
    it "gets 1/reviews" do
      options = { :some => "options" }
      client.should_receive(:get).with("1/reviews", options).and_return("success")
      client.get_reviews(options).should == "success"
    end
  end
end

