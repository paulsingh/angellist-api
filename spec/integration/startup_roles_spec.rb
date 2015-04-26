require 'spec_helper'

describe AngellistApi::Client::StartupRoles,
  :vcr => { :cassette_name => 'startup_roles' } do

  let(:client) { AngellistApi::Client.new }
  let(:startup_id) { 1124 }  # 500 Startups
  let(:user_id) { 155 }      # Naval

  it "gets a startup's relationships" do
    roles = client.get_startup_roles(:startup_id => startup_id)
    roles.startup_roles.each do |relationship|
      ROLES.should include relationship.role
    end
    roles.startup_roles.first.should have_key :user
  end

  it "gets a user's relationships" do
    roles = client.get_startup_roles(:user_id => user_id)
    roles.startup_roles.each do |relationship|
      ROLES.should include relationship.role
    end
    roles.startup_roles.first.should have_key :startup
  end

  context 'when opting into the v1 version of the resource' do
    let(:base_params) { { :v => 1 } }

    it "gets a startup's outgoing relationships" do
      params = { :startup_id => startup_id, :direction => 'outgoing' }.merge(base_params)
      roles = client.get_startup_roles(params)
      roles.startup_roles.each do |relationship|
        ROLES.should include relationship.role
      end
      roles.startup_roles.first.should have_key :tagged
      roles.startup_roles.first.tagged.should have_key :type
      roles.startup_roles.first.tagged.type.should eq 'Startup'
    end

    it "gets a startup's incoming relationships" do
      params = { :startup_id => startup_id }.merge(base_params)
      roles = client.get_startup_roles(params)
      roles.startup_roles.each do |relationship|
        ROLES.should include relationship.role
      end
      roles.startup_roles.first.should have_key :tagged
      roles.startup_roles.first.tagged.should have_key :type
      roles.startup_roles.first.tagged.type.should eq "User"
    end

    it "gets a user's relationships" do
      params = { :user_id => user_id }.merge(base_params)
      roles = client.get_startup_roles(params)
      roles.startup_roles.each do |relationship|
        ROLES.should include relationship.role
      end
      roles.startup_roles.first.should have_key :startup
      roles.startup_roles.first.should have_key :tagged
    end
  end
end

