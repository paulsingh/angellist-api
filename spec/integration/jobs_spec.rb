require 'spec_helper'

describe AngellistApi::Client::Startups do
  use_vcr_cassette 'jobs'

  let(:client) { AngellistApi::Client.new }

  it 'gets a listing of jobs' do
    jobs = client.get_jobs
    jobs.first.should have_key :job_type
    jobs.first.should have_key :startup
  end

  it 'gets information about a job' do
    job = client.get_job(2450)
    job.title.should eq 'Software Engineer'
    job.startup.name.should eq 'Kloudless'
  end

  it 'gets jobs for a given startup' do
    jobs = client.get_startup_jobs(1124)
    jobs.each { |job| job.startup.id.should eq 1124 }
  end

  it 'gets jobs for a given LocationTag' do
    # This returns a job where the only LocationTag is Las Vegas. I've
    # contacted AngelList to inquire if this is an API bug, doc fault, or?
    pending 'API bug?'

    sf = client.get_tag_jobs(1692)
    sf.jobs.each do |job|
      job.tags.select { |tag| tag.id == 1692 }.should_not be_empty
    end
  end
end

