require 'spec_helper'

describe AngellistApi::Client::Follows do
  use_vcr_cassette 'follows'

  let(:client) { AngellistApi::Client.new }

  it 'gets follows in batch' do
    follows = client.get_follows([4067161, 4067147])
    follows.last.follower.angellist_url.should eq 'http://angel.co/danielle-morrill'
    follows.last.followed.angellist_url.should eq 'http://angel.co/newco'
  end

  it "gets a user's followers" do
    followers = client.get_user_followers(2850)
    followers.users.should be_an_instance_of Array
    followers.users.first.should be_an_instance_of Hashie::Mash
  end

  it "gets IDs of a user's followers" do
    followers = client.get_user_follower_ids(2850)
    followers.ids.should be_an_instance_of Array
    followers.ids.first.should be_an_instance_of Fixnum
  end

  it 'gets users a user is following' do
    following = client.get_user_following(2850)
    following.users.first.should have_key :bio
  end

  it 'gets startups a user is following' do
    following = client.get_user_following(2850, :type => :startup)
    following.startups.first.should have_key :product_desc
  end

  it 'gets IDs of users a user is following' do
    followers = client.get_user_following_ids(2850)
    followers.ids.should be_an_instance_of Array
    followers.ids.first.should be_an_instance_of Fixnum
  end

  it 'gets IDs of startups a user is following' do
    followers = client.get_user_following_ids(2850, :type => :startup)
    followers.ids.should be_an_instance_of Array
    followers.ids.first.should be_an_instance_of Fixnum
  end

  it "gets a startup's followers" do
    followers = client.get_startup_followers(1124)  # 500-startups-fund
    followers.users.should be_an_instance_of Array
    followers.users.first.should be_an_instance_of Hashie::Mash
  end

  it "gets a startup's follower IDs" do
    followers = client.get_startup_follower_ids(1124)
    followers.ids.should be_an_instance_of Array
    followers.ids.first.should be_an_instance_of Fixnum
  end
end

