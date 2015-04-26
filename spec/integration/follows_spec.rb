require 'spec_helper'

describe AngellistApi::Client::Follows,
  :vcr => { :cassette_name => 'follows' } do

  let(:client) { AngellistApi::Client.new }
  let(:user_id) { 65956 }

  it 'gets follows in batch' do
    follows = client.get_follows([4067161, 4067147])
    follows.last.follower.angellist_url.should eq 'https://angel.co/danielle-morrill'
    follows.last.followed.angellist_url.should eq 'https://angel.co/newco'
  end

  it "gets a user's followers" do
    followers = client.get_user_followers(user_id)
    followers.users.should be_an_instance_of Array
    followers.users.first.should be_an_instance_of Hashie::Mash
  end

  it "gets IDs of a user's followers" do
    followers = client.get_user_follower_ids(user_id)
    followers.ids.should be_an_instance_of Array
    followers.ids.first.should be_an_instance_of Fixnum
  end

  it 'gets users a user is following' do
    following = client.get_user_following(user_id)
    following.users.first.should have_key :bio
  end

  it 'gets startups a user is following' do
    following = client.get_user_following(user_id, :type => :startup)
    following.startups.first.should have_key :product_desc
  end

  it 'gets IDs of users a user is following' do
    followers = client.get_user_following_ids(user_id)
    followers.ids.should be_an_instance_of Array
    followers.ids.first.should be_an_instance_of Fixnum
  end

  it 'gets IDs of startups a user is following' do
    followers = client.get_user_following_ids(user_id, :type => :startup)
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

