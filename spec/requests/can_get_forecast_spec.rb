require "rails_helper"

RSpec.describe 'forecast', type: :request do
  it 'can get forecast for a city' do
    headers = { "Content-Type": 'application/json',
      'Accept': 'application/json' }
    get '/api/v1/forecast', :params => {'location': 'denver,co'},
      :headers => headers

    results = JSON.parse(response.body)

    expect(response).to be_successful
    expect(results["data"]["attributes"]).to have_key("current")
    expect(results["data"]["attributes"]["current"]).to have_key("icon")
    expect(results["data"]["attributes"]["current"]).to have_key("summary")
    expect(results["data"]["attributes"]["current"]).to have_key("humidity")
    expect(results["data"]["attributes"]).to have_key("hourly")
    expect(results["data"]["attributes"]["hourly"]).to have_key("icon")
    expect(results["data"]["attributes"]["hourly"]).to have_key("temperature")
    expect(results["data"]["attributes"]["hourly"]).to have_key("summary")
    expect(results["data"]["attributes"]).to have_key("daily")
    expect(results["data"]["attributes"]["daily"]).to have_key("percent_precip")
    expect(results["data"]["attributes"]["daily"]).to have_key("precip_type")
    expect(results["data"]["attributes"]["daily"]).to have_key("hi_temp")
  end
end
