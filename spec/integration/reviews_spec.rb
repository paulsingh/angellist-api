require 'spec_helper'

describe AngellistApi::Client::Reviews,
  :vcr => { :cassette_name => 'reviews' } do

  let(:client) { AngellistApi::Client.new }

  it 'gets reviews of a user' do
    reviews = client.get_reviews(:user_id => 2850)
    reviews.should have_key :total_positive
    reviews.reviews.should be_an_instance_of Array
    reviews.reviews.first.should have_key :rating
  end

  it 'gets a specific review' do
    review = client.get_review(:id => 1098)
    review.should have_key :note
    review.rating.should eq 1
  end
end

