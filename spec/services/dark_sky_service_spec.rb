require "rails_helper"

describe 'when given a city' do
  it 'can get lat long' do
    location = 'orlando,fl'
    dark_sky_service = DarkSkyService.new(location)

    expect(dark_sky_service.find_lat).to be_an_instance_of Integer
    expect(dark_sky_service.find_long).to be_an_instance_of Integer
  end
end
