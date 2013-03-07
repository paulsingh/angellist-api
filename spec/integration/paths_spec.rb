require 'spec_helper'

describe AngellistApi::Client::Paths, :authenticated,
  # Personal for authenticated account, manually maintained fixture
  :vcr => { :cassette_name => 'paths', :record => :none } do

  let(:client) { AngellistApi::Client.new }

  context 'when requesting by user IDs' do
    let(:paths) { client.get_paths(:user_ids => [1274]) }

    it 'gets paths between authenticated user and given user IDs' do
      paths.should have_key '1274'
      vertex = paths['1274'].first.first
      vertex.should have_key :connector
      vertex.should have_key :connection
    end
  end

  context 'when requesting by startup IDs' do
    let(:paths) { client.get_paths(:startup_ids => [76155]) }

    it 'gets paths between authenticated user and given startup IDs' do
      paths.should have_key '76155'
      vertex = paths['76155'].first.first
      vertex.should have_key :connector
      vertex.should have_key :connection
    end
  end
end

