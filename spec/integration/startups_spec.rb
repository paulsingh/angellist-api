require 'spec_helper'

describe AngellistApi::Client::Startups,
  :vcr => { :cassette_name => 'startups' } do

  let(:client) { AngellistApi::Client.new }

  it 'gets information about a startup' do
    startup = client.get_startup(1124)
    startup.angellist_url.should eq 'http://angel.co/500-startups-fund'
  end

  it 'gets comments about a startup' do
    comments = client.startup_comments(1124)
    comments.should be_an Array
    comments.first.should have_key :comment
    comments.first.should have_key :user
  end

  it 'gets startups in batch' do
    startups = client.get_startups [1124, 31627]
    startups.first.name.should eq '500 Startups (Fund)'
    startups.last.angellist_url.should eq 'http://angel.co/newco'
  end

  it 'gets fundraising startups' do
    response = client.all_startups(:filter => :raising)
    response.should be_an Hash
    response.should have_key :startups
    startups = response.startups
    startups.should be_an Array
    startups.first.should have_key :id
  end

  it 'gets information about a startup found by URL slug' do
    startup = client.startup_search(:slug => '500-startups-fund')
    startup.company_url.should eq 'http://500.co'
  end

  it 'gets information about a startup found by site domain' do
    startup = client.startup_search(:domain => '500.co')
    startup.angellist_url.should eq 'http://angel.co/500-startups-fund'
  end

  it 'gets a company\s startup roles' do
    roles = client.startup_roles(1124)
    roles.startup_roles.size.should be > 0
    roles.startup_roles.each do |relationship|
      ROLES.should include relationship.role
    end
  end

  it 'gets a company\s outgoing startup roles' do
    roles = client.startup_roles(1124)
    roles.startup_roles.size.should be > 0
    roles.startup_roles.each do |relationship|
      ROLES.should include relationship.role
    end
  end
end

