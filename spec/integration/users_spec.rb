require 'spec_helper'

describe AngellistApi::Client::Users,
  :vcr => { :cassette_name => 'users' } do

  let(:client) { AngellistApi::Client.new }
  let(:user_id) { 155 }  # Naval
  let(:tag_id) { 1654 }  # Louisville tag

  it 'gets info for a user' do
    user = client.get_user(user_id)
    user.angellist_url.should eq 'https://angel.co/naval'
  end

  it 'gets users in batch' do
    users = client.get_users([15821, 100303])
    users.map { |u| u.angellist_url }.should eq %w[https://angel.co/tchae https://angel.co/scomma]
  end

  it 'gets info for a user by URL slug' do
    user = client.user_search(:slug => 'naval')
    user.linkedin_url.should eq 'http://www.linkedin.com/in/navalr'
  end

  it 'gets the companies that a user has been tagged in' do
    roles = client.user_roles(user_id)
    roles.startup_roles.size.should be > 0
    roles.startup_roles.each do |relationship|
      ROLES.should include relationship.role
    end
  end

  it 'gets the investors that are tagged with the given tag' do
    investors = client.user_tags(tag_id, :investor => 'by_residence')
    user = client.get_user(investors.users.first.id)
    user.locations.any? { |loc| loc.id == tag_id  }.should be true
  end
end

