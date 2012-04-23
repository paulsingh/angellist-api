require 'spec_helper'

describe AngellistApi::Client::ActivityFeeds do
  use_vcr_cassette 'activity_feeds'

  TYPES = %w[Comment Follow Review StartupIntro StartupPublish StartupRole StatusUpdate Update].freeze
  let(:client) { AngellistApi::Client.new }

  it 'fetches Activity Feed entries' do
    client.get_feed.should be_an_instance_of Hashie::Mash
  end

  it 'wraps API item types' do
    feed = client.get_feed[:feed]
    feed.each do |activity|
      TYPES.should include activity.item.type
    end
  end

  it 'gets a single Activity Feed entry' do
    activity = client.feed_item('8fCC3')
    activity.should have_key :item
    activity.should have_key :actor
    activity.should have_key :target
  end
end

