require 'spec_helper'

describe AngellistApi::Client::Reviews,
  :vcr => { :cassette_name => 'reviews' } do

  let(:client) { AngellistApi::Client.new }
  let(:user_id) { 155 }  # Naval

  it 'gets reviews of a user' do
    reviews = client.get_reviews(:user_id => user_id)
    reviews.should have_key :total_positive
    reviews.reviews.should be_an_instance_of Array
    reviews.reviews.first.should have_key :note
    reviews.reviews.first.should have_key :relationship_to_reviewer
  end

  it 'gets a specific review' do
    review = client.get_review(1098)
    review.should have_key :note
    review.should have_key :relationship_to_reviewer
  end
end

