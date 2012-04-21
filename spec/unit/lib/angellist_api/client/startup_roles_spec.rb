require 'spec_helper'

describe AngellistApi::Client::StartupRoles do
  let(:client) { AngellistApi::Client.new }

  describe "#get_startup_roles" do
    it "gets to 1/follows" do
      options = { :some => "options" }
      client.should_receive(:get).with("1/startup_roles", options, :format => :json).and_return("success")
      client.get_startup_roles(options).should == "success"
    end
  end
end

