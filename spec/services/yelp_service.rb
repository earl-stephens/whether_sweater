require "rails_helper"

describe 'yelp service' do
  it 'can find restaurants for a location' do
    location = 'atlanta,ga'
    yelp_service = YelpService.new

    expect(yelp_service.find_diner(location)).to have_key(:businesses)
    expect(yelp_service.find_diner(location)[:businesses][0]).to have_key(:name)
  end
end
