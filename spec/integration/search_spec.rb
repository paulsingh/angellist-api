require 'spec_helper'

describe AngelList::Client::Search,
  :vcr => { :cassette_name => 'search' } do

  let(:client) { AngelList::Client.new }
  let(:valid_types) { %w[User Startup MarketTag LocationTag].freeze }

  it 'searches with a general query' do
    results = client.search('machine learning')
    results.should be_an Array
  end

  it 'wraps API item types' do
    results = client.search('machine learning')
    results.each do |result|
      valid_types.should include result.type
    end
  end

  it 'searches with a scoped query' do
    results = client.search('joshua', :type => 'User')
    results.each { |res| res.type.should eq 'User' }
    results.map { |res| res.name }.should include 'Joshua Slayton'
  end
end

