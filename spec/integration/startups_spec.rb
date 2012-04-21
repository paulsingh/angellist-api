require 'spec_helper'

describe AngellistApi::Client::Startups do
  use_vcr_cassette 'startups'

  let(:client) { AngellistApi::Client.new }

  it 'gets information about a startup' do
    startup = client.get_startup(1124)
    startup.angellist_url.should eq 'http://angel.co/500-startups-fund'
  end

  it 'gets information about a startup found by URL slug' do
    startup = client.startup_search(:slug => '500-startups-fund')
    startup.company_url.should eq 'http://500.co'
  end

  it 'gets information about a startup found by site domain' do
    startup = client.startup_search(:domain => '500.co')
    startup.angellist_url.should eq 'http://angel.co/500-startups-fund'
  end
end

