require 'spec_helper'

describe AngelList::Client::StartupRoles,
  :vcr => { :cassette_name => 'startup_roles' } do

  ROLES = %w[founder employee past_investor advisor incubator referrer]
  let(:client) { AngelList::Client.new }

  it "gets a startup's relationships" do
    roles = client.get_startup_roles(:startup_id => 1124)
    roles.startup_roles.each do |relationship|
      ROLES.should include relationship.role
    end
    roles.startup_roles.first.should have_key :user
  end

  it "gets a user's relationships" do
    roles = client.get_startup_roles(:user_id => 2850)
    roles.startup_roles.each do |relationship|
      ROLES.should include relationship.role
    end
    roles.startup_roles.first.should have_key :startup
  end
end

