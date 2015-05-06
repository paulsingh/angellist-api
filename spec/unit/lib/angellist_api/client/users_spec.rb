require 'spec_helper'

describe AngellistApi::Client::Users do
  let(:client) { AngellistApi::Client.new }

  describe "#get_user" do
    it "gets 1/users/<id>" do
      id = "123"
      client.should_receive(:get).with("1/users/#{id}", {}).and_return("success")
      client.get_user(id).should == "success"
    end
  end

  describe '#get_users' do
    it 'gets 1/users/batch?ids=<ids>' do
      ids = [1, 2, 3]
      client.should_receive(:get).
        with('1/users/batch', { :ids => ids.join(',') }).
        and_return('success')
      client.get_users(ids).should == 'success'
    end
  end

  describe "#user_search" do
    it "gets 1/users/search" do
      options = { :some => "options "}
      client.should_receive(:get).with("1/users/search", options).and_return("success")
      client.user_search(options).should == "success"
    end
  end

  describe "#me" do
    it "gets 1/me" do
      client.should_receive(:get).with("1/me").and_return("success")
      client.me.should == "success"
    end
  end

  describe '#get_tag_users' do
    it 'gets 1/tags/<id>/users' do
      id = "123"
      client.should_receive(:get).with("1/tags/#{id}/users", {}).and_return("success")
      client.get_tag_users(id).should == "success"
    end
  end
end

