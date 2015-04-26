require 'spec_helper'

describe AngellistApi::Client::Jobs, :authenticated,
  :vcr => { :cassette_name => 'jobs' } do

  let(:client) { AngellistApi::Client.new }
  let(:job_id) { 63344 }

  it 'gets a listing of jobs' do
    jobs = client.get_jobs.jobs
    jobs.first.should have_key :job_type
    jobs.first.should have_key :startup
  end

  it 'gets information about a job' do
    job = client.get_job(job_id)
    job.title.should eq 'Software Engineer'
    job.startup.name.should eq 'Genetesis'
  end

  it 'gets jobs for a given startup' do
    jobs = client.get_startup_jobs(1124)
    jobs.each { |job| job.startup.id.should eq 1124 }
  end

  it 'gets jobs for a given LocationTag' do
    sf = client.get_tag_jobs(1692)
    sf.jobs.each do |job|
      job.tags.select { |tag| tag.id == 1692 }.should_not be_empty
    end
  end
end

