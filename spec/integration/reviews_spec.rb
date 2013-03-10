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
end

