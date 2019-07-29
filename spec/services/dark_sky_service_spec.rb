require "rails_helper"

describe 'when given a city' do
  it 'can get lat long' do
    location = 'orlando,fl'
    dark_sky_service = DarkSkyService.new(location)

    expect(dark_sky_service.find_lat).to be_an_instance_of Integer
    expect(dark_sky_service.find_long).to be_an_instance_of Integer
  end

  it 'can get the weather forecast' do
    location = 'seattle,wa'
    dark_sky_service = DarkSkyService.new(location)
    results = dark_sky_service.weather_data

    expect(results).to be_a Hash
    expect(results).to have_key(:currently)
    expect(results).to have_key(:hourly)
    expect(results).to have_key(:daily)
    expect(results[:currently]).to have_key(:icon)
    expect(results[:hourly]).to have_key(:summary)
    expect(results[:daily][:data][0]).to have_key(:temperatureHigh)
  end
end
