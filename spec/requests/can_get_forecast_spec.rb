require "rails_helper"

RSpec.describe 'forecast', type: :request do
  it 'can get forecast for a city' do
    headers = { "Content-Type": 'application/json',
      'Accept': 'application/json' }
    get '/api/v1/forecast', :params => {'location': 'denver,co'},
      :headers => headers

    results = JSON.parse(response.body)

    expect(response).to be_successful
    expect(results).to have_key("current")
    expect(results["current"]).to have_key("icon")
    expect(results["current"]).to have_key("summary")
    expect(results["current"]).to have_key("humidity")
    expect(results).to have_key("hourly")
    expect(results["hourly"]).to have_key("icon")
    expect(results["hourly"]).to have_key("temperature")
    expect(results["hourly"]).to have_key("summary")
    expect(results).to have_key("daily")
    expect(results["daily"]).to have_key("percent_precip")
    expect(results["daily"]).to have_key("precip_type")
    expect(results["daily"]).to have_key("hi_temp")
  end
end
