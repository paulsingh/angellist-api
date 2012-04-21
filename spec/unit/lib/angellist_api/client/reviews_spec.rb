require 'spec_helper'

describe AngellistApi::Client::Reviews do
  let(:client) { AngellistApi::Client.new }

  describe "#get_reviews" do
    it "gets 1/reviews" do
      options = { :some => "options" }
      client.should_receive(:get).with("1/reviews", options, :format => :json, :phoenix => true).and_return("success")
      client.get_reviews(options).should == "success"
    end
  end
end

