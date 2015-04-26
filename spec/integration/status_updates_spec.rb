require 'spec_helper'

describe AngellistApi::Client::StatusUpdates,
  :vcr => { :cassette_name => 'status_updates' } do

  let(:client) { AngellistApi::Client.new }
  let(:user_id) { 155 }      # Naval
  let(:startup_id) { 1124 }  # 500 Startups

  it 'gets status updates for a user' do
    statuses = client.get_status_updates(:user_id => user_id)
    statuses.status_updates.first.should have_key :message
  end

  it 'gets status updates for a startup' do
    statuses = client.get_status_updates(:startup_id => startup_id)
    statuses.status_updates.first.should have_key :message
  end
end

