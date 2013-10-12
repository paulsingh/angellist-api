require 'spec_helper'

describe AngellistApi::Client::Startups do
  let(:client) { AngellistApi::Client.new }

  describe "#get_startup" do
    it "gets 1/startups/<id>" do
      id = "123"
      client.should_receive(:get).with("1/startups/#{id}").and_return("success")
      client.get_startup(id).should == "success"
    end
  end

  describe '#startup_comments' do
    it 'gets 1/startups/<id>/comments' do
      id = 123
      client.should_receive(:get).with("1/startups/#{id}/comments").and_return('success')
      client.startup_comments(id).should eq 'success'
    end
  end

  describe '#get_startups' do
    it 'gets 1/startups/batch' do
      ids = [1, 2, 3]
      client.should_receive(:get).
        with('1/startups/batch', { :ids => ids.join(',') }).
        and_return('success')
      client.get_startups(ids).should == 'success'
    end
  end

  describe '#all_startups' do
    it 'gets 1/startups' do
      client.should_receive(:get).
        with('1/startups', { :filter => :filter }).
        and_return('success')
      client.all_startups(:filter => :filter).should == 'success'
    end
  end

  describe "#startup_search" do
    it "gets 1/startups/search" do
      options = { :some => "options" }
      client.should_receive(:get).with("1/startups/search", options).and_return("success")
      client.startup_search(options).should == "success"
    end
  end
end

