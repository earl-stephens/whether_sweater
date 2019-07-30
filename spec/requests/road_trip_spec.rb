require "rails_helper"

describe 'user can post cities for a road trip' do
  it 'and get weather forecast at the destination' do
    User.create!(email: "whatever@example.com", password: "password", api_key: 'this_is_my_api_key')
    body = {"origin": "Denver,CO", "destination": "Pueblo,CO", "api_key": "this_is_my_api_key" }

    post '/api/v1/road_trip', :params => body

    results = JSON.parse(response.body)
    binding.pry

    expect(response).to be_successful
    expect(results["data"]["attributes"]["predicted"]).to have_key("temperature")
    expect(results["data"]["attributes"]["predicted"]).to have_key("summary")
    expect(results["data"]["attributes"]["predicted"]).to have_key("travel_time")

  end
end
