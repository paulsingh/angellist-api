require 'spec_helper'

describe AngelList::Client::Users,
  :vcr => { :cassette_name => 'users' } do

  let(:client) { AngelList::Client.new }

  it 'gets info for a user' do
    user = client.get_user(2850)
    user.angellist_url.should eq 'http://angel.co/500startups'
  end

  it 'gets users in batch' do
    users = client.get_users([15821, 100303])
    users.map { |u| u.angellist_url }.should eq %w[http://angel.co/tchae http://angel.co/scomma]
  end

  it 'gets info for a user by URL slug' do
    user = client.user_search(:slug => '500startups')
    user.linkedin_url.should eq 'http://www.linkedin.com/company/500-startups'
  end
end

