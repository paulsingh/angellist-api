require 'spec_helper'

describe AngellistApi::Client::Users do
  use_vcr_cassette 'users'

  let(:client) { AngellistApi::Client.new }

  it 'gets info for a user' do
    user = client.get_user(2850)
    user.angellist_url.should eq 'http://angel.co/500startups'
  end

  it 'gets info for a user by URL slug' do
    user = client.user_search(:slug => '500startups')
    user.linkedin_url.should eq 'http://www.linkedin.com/company/500-startups'
  end
end

