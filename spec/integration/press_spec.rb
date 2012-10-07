require 'spec_helper'

describe AngellistApi::Client::Startups do
  use_vcr_cassette 'press'

  let(:client) { AngellistApi::Client.new }

  it 'gets press for a given startup' do
    options = { startup_id: 6702 }
    press = client.get_press(options).press
    press.first.should have_key :title
    press.first.should have_key :url
  end
end
