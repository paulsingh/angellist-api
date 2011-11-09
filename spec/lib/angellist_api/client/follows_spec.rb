require 'spec_helper'

describe AngellistApi::Client::Follows do
  before(:each) do
    @client = AngellistApi::Client.new
  end
  
  describe "#new_follow" do
    it "should post to 1/follows" do
      options = { :some => "options" }
      @client.expects(:post).with("1/follows", options, :format => :json, :phoenix => true).returns("success")
      @client.new_follow(options).should == "success"
    end
  end
  
  describe "#delete_follow" do
    it "should delete 1/follows" do
      options = { :some => "options" }
      @client.expects(:delete).with("1/follows", options, :format => :json, :phoenix => true).returns("success")
      @client.delete_follow(options).should == "success"
    end
  end

  describe "#get_user_followers" do
    it "should get 1/users/<id>/followers" do
      id = "123"
      @client.expects(:get).with("1/users/#{id}/followers", :format => :json, :phoenix => true).returns("success")
      @client.get_user_followers(id).should == "success"
    end
  end

  describe "#get_user_follower_ids" do
    it "should get 1/users/<id>/followers/ids" do
      id = "123"
      @client.expects(:get).with("1/users/#{id}/followers/ids", :format => :json, :phoenix => true).returns("success")
      @client.get_user_follower_ids(id).should == "success"
    end
  end

  describe "#get_user_following" do
    it "should get 1/users/<id>/following" do
      id = "123"
      options = { :some => "options" }
      @client.expects(:get).with("1/users/#{id}/following", options, :format => :json, :phoenix => true).returns("success")
      @client.get_user_following(id, options).should == "success"
    end
  end

  describe "#get_user_following_ids" do
    it "should get 1/users/<id>/following/ids" do
      id = "123"
      options = { :some => "options" }
      @client.expects(:get).with("1/users/#{id}/following/ids", options, :format => :json, :phoenix => true).returns("success")
      @client.get_user_following_ids(id, options).should == "success"
    end
  end

  describe "#get_startup_followers" do
    it "should get 1/startups/<id>/followers" do
      id = "123"
      @client.expects(:get).with("1/startups/#{id}/followers", :format => :json, :phoenix => true).returns("success")
      @client.get_startup_followers(id).should == "success"
    end
  end

  describe "#get_startup_follower_ids" do
    it "should get 1/startups/<id>/followers/ids" do
      id = "123"
      @client.expects(:get).with("1/startups/#{id}/followers/ids", :format => :json, :phoenix => true).returns("success")
      @client.get_startup_follower_ids(id).should == "success"
    end
  end

end