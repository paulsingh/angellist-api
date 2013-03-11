require 'spec_helper'

describe AngelList::Client::StatusUpdates,
  :vcr => { :cassette_name => 'status_updates' } do

  let(:client) { AngelList::Client.new }

  it 'gets status updates for a user' do
    statuses = client.get_status_updates(:user_id => 2850)
    statuses.status_updates.first.should have_key :message
  end

  it 'gets status updates for a startup' do
    statuses = client.get_status_updates(:startup_id => 1124)
    statuses.status_updates.first.should have_key :message
  end
end

