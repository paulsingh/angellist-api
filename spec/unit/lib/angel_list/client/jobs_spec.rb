require 'spec_helper'

describe AngelList::Client::Jobs do
  let(:client) { AngelList::Client.new }

  describe '#get_jobs' do
    it 'gets 1/jobs' do
      options = { :some => "options" }
      client.should_receive(:get).with('1/jobs', options).and_return('success')
      client.get_jobs(options).should == 'success'
    end
  end

  describe '#get_job' do
    it 'gets 1/jobs/<id>' do
      id = 123
      client.should_receive(:get).with("1/jobs/#{id}").and_return('success')
      client.get_job(id).should == 'success'
    end
  end

  describe '#get_startup_jobs' do
    it 'gets 1/startups/<id>/jobs' do
      id = 123
      client.should_receive(:get).with("1/startups/#{id}/jobs").and_return('success')
      client.get_startup_jobs(id).should == 'success'
    end
  end

  describe '#get_tag_jobs' do
    it 'gets 1/tags/<id>/jobs' do
      id = 123
      options = { :some => 'options' }
      client.should_receive(:get).with("1/tags/#{id}/jobs", options).and_return('success')
      client.get_tag_jobs(id, options).should == 'success'
    end
  end
end

