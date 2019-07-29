require "rails_helper"

describe 'yelp service' do
  it 'can find restaurants for a location' do
    start = 'atlanta,ga'
    ending = 'rome,ga'
    category = 'chinese'
    yelp_service = YelpService.new(start, ending, category)

    expect(yelp_service.diner_data).to have_key(:businesses)
    expect(yelp_service.diner_data[:businesses][0]).to have_key(:name)
  end
end
