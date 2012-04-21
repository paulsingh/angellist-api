require 'spec_helper'

describe AngellistApi::Client::StatusUpdates do
  use_vcr_cassette 'status_updates'

  let(:client) { AngellistApi::Client.new }

  it 'gets status updates for a user' do
    statuses = client.get_status_updates(:user_id => 2850)
    statuses.status_updates.first.should have_key :message
  end

  it 'gets status updates for a startup' do
    statuses = client.get_status_updates(:startup_id => 1124)
    statuses.status_updates.first.should have_key :message
  end
end

