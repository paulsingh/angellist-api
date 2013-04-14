require 'spec_helper'

describe AngellistApi::Error do
  include HttpHeaders

  describe '#new' do
    specify 'message parameter can be nil' do
      expect { AngellistApi::Error.new(nil, :header => 'data') }.to_not raise_error
    end

    it 'builds an error with the given message' do
      error = AngellistApi::Error.new('bad data', :header => 'data')
      error.message.should == 'bad data'
    end

    it 'sets http_headers attribute' do
      error = AngellistApi::Error.new('some message', :some => 'value')
      error.http_headers.should == { :some => 'value' }
    end
  end

  # NOTE: AngelList doesn't actually support this yet...
  describe '#ratelimit_reset' do
    subject { described_class.new('message', headers).ratelimit_reset }

    context 'with X-RateLimit-Reset header set' do
      let(:unixtime) { Time.now.to_i }
      let(:headers) { headerize('X-RateLimit-Reset' => unixtime) }

      it 'returns the time of reset' do
        subject.should == Time.at(unixtime)
      end
    end

    context 'with X-RateLimit-Reset unset' do
      let(:headers) { headerize({}) }
      it { should be_nil }
    end
  end

  describe '#ratelimit_limit' do
    subject { described_class.new('message', headers).ratelimit_limit }

    context 'with X-RateLimit-Limit header set' do
      let(:limit) { '1000' }
      let(:headers) { headerize('X-RateLimit-Limit' => limit) }

      it 'returns the limit as an integer' do
        subject.should eq 1000
      end
    end

    context 'with X-RateLimit-Limit unset' do
      let(:headers) { headerize({}) }
      it { should be_nil }
    end
  end

  describe '#ratelimit_remaining' do
    subject { described_class.new('message', headers).ratelimit_remaining }

    context 'with X-RateLimit-Remaining header set' do
      let(:remaining) { '22' }
      let(:headers) { headerize('X-RateLimit-Remaining' => remaining) }

      it 'returns remaining request count as an integer' do
        subject.should eq 22
      end
    end

    context 'with X-RateLimit-Remaining unset' do
      let(:headers) { headerize({}) }
      it { should be_nil }
    end
  end

  # NOTE: AngelList doesn't actually support this yet...
  describe '#retry_after' do
    subject { described_class.new('message', headerize({})).retry_after }
    let(:now) { Time.now }

    before { Timecop.freeze(now) }
    after  { Timecop.return }

    context 'when limit reset time is known' do
      let(:reset_at) { now + 3600 }

      before do
        described_class.any_instance.stub(:ratelimit_reset).and_return(reset_at)
      end

      it 'gives time in seconds until it is acceptable to make another call' do
        subject.should eq reset_at - now
      end
    end

    context 'when limit reset time is not known' do
      it { should be_nil }
    end

    context 'when limit reset time is past' do
      let(:reset_at) { now - 3600 }

      before do
        described_class.any_instance.stub(:ratelimit_reset).and_return(reset_at)
      end

      it { should be_zero }
    end
  end
end

# NOTE: AngelList doesn't actually support this yet...
describe AngellistApi::Error::TooManyRequests do
  include HttpHeaders

  subject { described_class.new('message', headers).retry_after }

  context 'with Retry-After header set' do
    let(:wait) { '12' }
    let(:headers) { headerize('Retry-After' => wait) }

    it 'returns the seconds to wait until retrying' do
      subject.should == 12
    end
  end

  context 'with Retry-After unset' do
    let(:headers) { headerize({}) }
    it { should be_nil }
  end
end

