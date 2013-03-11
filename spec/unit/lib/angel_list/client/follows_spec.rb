require 'spec_helper'

describe AngelList::Client::Follows do
  let(:client) { AngelList::Client.new }

  describe "#new_follow" do
    it "posts to 1/follows" do
      options = { :some => "options" }
      client.should_receive(:post).with("1/follows", options).and_return("success")
      client.new_follow(options).should == "success"
    end
  end

  describe "#delete_follow" do
    it "deletes 1/follows" do
      options = { :some => "options" }
      client.should_receive(:delete).with("1/follows", options).and_return("success")
      client.delete_follow(options).should == "success"
    end
  end

  describe '#get_follows' do
    it 'gets 1/follows/batch' do
      ids = [1, 2, 3]
      client.should_receive(:get).
        with("1/follows/batch", { :ids => ids.join(',') }).
        and_return("success")
      client.get_follows(ids).should == "success"
    end
  end

  describe "#get_user_followers" do
    it "gets 1/users/<id>/followers" do
      id = "123"
      client.should_receive(:get).with("1/users/#{id}/followers").and_return("success")
      client.get_user_followers(id).should == "success"
    end
  end

  describe "#get_user_follower_ids" do
    it "gets 1/users/<id>/followers/ids" do
      id = "123"
      client.should_receive(:get).with("1/users/#{id}/followers/ids").and_return("success")
      client.get_user_follower_ids(id).should == "success"
    end
  end

  describe "#get_user_following" do
    it "gets 1/users/<id>/following" do
      id = "123"
      options = { :some => "options" }
      client.should_receive(:get).with("1/users/#{id}/following", options).and_return("success")
      client.get_user_following(id, options).should == "success"
    end
  end

  describe "#get_user_following_ids" do
    it "gets 1/users/<id>/following/ids" do
      id = "123"
      options = { :some => "options" }
      client.should_receive(:get).with("1/users/#{id}/following/ids", options).and_return("success")
      client.get_user_following_ids(id, options).should == "success"
    end
  end

  describe "#get_startup_followers" do
    it "gets 1/startups/<id>/followers" do
      id = "123"
      client.should_receive(:get).with("1/startups/#{id}/followers").and_return("success")
      client.get_startup_followers(id).should == "success"
    end
  end

  describe "#get_startup_follower_ids" do
    it "gets 1/startups/<id>/followers/ids" do
      id = "123"
      client.should_receive(:get).with("1/startups/#{id}/followers/ids").and_return("success")
      client.get_startup_follower_ids(id).should == "success"
    end
  end
end

