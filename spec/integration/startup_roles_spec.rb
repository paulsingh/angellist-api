require 'spec_helper'

describe AngellistApi::Client::StartupRoles,
  :vcr => { :cassette_name => 'startup_roles' } do

  let(:client) { AngellistApi::Client.new }

  it "gets a startup's outgoing relationships" do
    roles = client.get_startup_roles(:startup_id => 1124)
    roles.startup_roles.each do |relationship|
      ROLES.should include relationship.role
    end
    roles.startup_roles.first.should have_key :tagged
    roles.startup_roles.first.tagged.should have_key :type
    roles.startup_roles.first.tagged.type.should eq "User"
  end

  it "gets a startup's incoming relationships" do
    roles = client.get_startup_roles(:startup_id => 1124, :direction => "incoming")
    roles.startup_roles.each do |relationship|
      ROLES.should include relationship.role
    end
    roles.startup_roles.first.should have_key :tagged
    roles.startup_roles.first.tagged.should have_key :type
    roles.startup_roles.first.tagged.type.should eq "User"
  end

  it "gets a user's relationships" do
    roles = client.get_startup_roles(:user_id => 2850)
    roles.startup_roles.each do |relationship|
      ROLES.should include relationship.role
    end
    roles.startup_roles.first.should have_key :startup
    roles.startup_roles.first.should have_key :tagged
  end
end

