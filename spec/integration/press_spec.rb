require 'spec_helper'

describe AngellistApi::Client::Press,
  :vcr => { :cassette_name => 'press' } do

  let(:client) { AngellistApi::Client.new }

  it 'gets press for a given startup' do
    options = { startup_id: 6702 }
    press = client.get_press(options).press
    press.first.should have_key :title
    press.first.should have_key :url
  end
end

