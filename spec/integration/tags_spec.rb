require 'spec_helper'

describe AngellistApi::Client::Tags,
  :vcr => { :cassette_name => 'tags' } do

  let(:client) { AngellistApi::Client.new }

  it 'gets info for a tag' do
    tag = client.get_tag(856)
    tag.display_name.should eq 'Venture Capital'
  end

  it "gets a tag's children" do
    children = client.get_tag_children(856).children
    children.map { |tag| tag.display_name }.should include 'Angels'
  end

  it "gets a tag's parents" do
    parents = client.get_tag_parents(856).parents
    parents.map { |tag| tag.display_name }.should include 'Organized Crime'  # WTF?
  end

  it 'gets startups tagged with a given tag' do
    tagged = client.get_tag_startups(856)
    tagged.should have_key :startups
    tagged.startups.first.should have_key :company_url
  end
end

