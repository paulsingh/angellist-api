require 'spec_helper'

describe 'Errors' do
  let(:client) { AngellistApi::Client.new }

  describe AngellistApi::Error::TooManyRequests do
    context 'when response is an over rate limit error',
      :vcr => { :cassette_name => 'errors/too_many_requests' } do

      it 'is raised' do
        expect { client.me }.to raise_error described_class
      end
    end

    context 'when response is some other 403 Forbidden error',
      :vcr => { :cassette_name => 'errors/forbidden' } do

      it 'is not raised' do
        expect { client.me }.to raise_error AngellistApi::Error::Forbidden
      end
    end
  end
end

