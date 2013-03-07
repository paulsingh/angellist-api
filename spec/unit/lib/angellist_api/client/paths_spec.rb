require 'spec_helper'

describe AngellistApi::Client::Paths do
  let(:client) { AngellistApi::Client.new }

  describe '#get_paths' do
    it 'gets 1/messages' do
      options = { :some => 'options' }
      client.should_receive(:get).with('1/paths', options).and_return('success')
      client.get_paths(options).should == 'success'
    end

    it 'accepts an Array of startup_ids' do
      options = { :startup_ids => [1,2] }
      client.should_receive(:get).with('1/paths', :startup_ids => '1,2')
      client.get_paths(options)
    end

    it 'accepts an Array of user_ids' do
      options = { :user_ids => [1,2] }
      client.should_receive(:get).with('1/paths', :user_ids => '1,2')
      client.get_paths(options)
    end
  end
end

