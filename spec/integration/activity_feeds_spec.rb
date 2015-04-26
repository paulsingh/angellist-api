require 'spec_helper'

describe AngellistApi::Client::ActivityFeeds,
  :vcr => { :cassette_name => 'activity_feeds' } do

  let(:client) { AngellistApi::Client.new }
  let(:valid_types) do  # NOTE: some are undocumented
    %w[Answer Comment Follow Press Question Review StartupIntro StartupPublish
       StartupRole StatusUpdate Update].freeze
  end

  it 'fetches Activity Feed entries' do
    client.get_feed.should be_an_instance_of Hashie::Mash
  end

  it 'wraps API item types' do
    feed = client.get_feed[:feed]
    feed.each do |activity|
      valid_types.should include activity.item.type
      activity.should have_key :actor
      activity.should have_key :target
    end
  end
end

