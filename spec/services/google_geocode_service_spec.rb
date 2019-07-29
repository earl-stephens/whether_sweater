require "rails_helper"

describe 'google geocode service' do
  it 'can find coords of a city' do
    location = 'atlanta, ga'
    geocode = GoogleGeocodeService.new

    results = geocode.find_coords(location)

    centered_location = results[:results][0][:geometry][:location]
    expect(centered_location).to be_a Hash
    expect(centered_location).to have_key(:lat)
    expect(centered_location).to have_key(:lng)
  end

  it 'can format an address' do
    location = 'New Orleans,LA'
    geocode = GoogleGeocodeService.new

    expected = 'New+Orleans+LA'
    expect(geocode.format_address(location)).to eq(expected)
  end

  it 'can get time to a destination' do
    start = 'denver,co'
    ending = 'pueblo,co'
    geocode = GoogleGeocodeService.new

    expect(geocode.get_time(start, ending)).to have_key("text")
  end
end
