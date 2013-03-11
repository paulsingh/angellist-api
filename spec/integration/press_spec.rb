require 'spec_helper'

describe AngelList::Client::Press,
  :vcr => { :cassette_name => 'press' } do

  let(:client) { AngelList::Client.new }

  it 'gets press for a given startup' do
    options = { startup_id: 6702 }
    press = client.get_press(options).press
    press.first.should have_key :title
    press.first.should have_key :url
  end
end

