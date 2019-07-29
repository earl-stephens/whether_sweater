require "rails_helper"
#
# Munchies
#
# GET /api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese
# Content-Type: application/json
# Accept: application/json
#
# You will use the Google Directions API:
# https://developers.google.com/maps/documentation/directions/start
# in order to find out how long it will take to travel from the two locations, and then using the Yelp API, you will find all of the restaurants matching the cuisine, the example here is Chinese, that WILL BE OPEN at your estimated time of arrival.
#
# Your API will return the end city, and three
# restaurants, along with their name and address.
#
# Technical notes:
#
# The Yelp API only accepts time as UNIX time.
# You can conert a Time object into UNIX time by
# doing something like this: Time.now.to_i
#
# You can find out time in the future using a
# feature built into Rails' ActiveSupport which
# will let you do things like this: Time.now +
#   4.hours (This will ONLY work in Rails and not
# a pry session run from the command line)

describe 'user can find open restaurants', type: :request do
  it 'at trip destination' do
    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'

    results = JSON.parse(response.body)
    expect(response).to be_successful
    expect(results).to be_a Hash
    expect(results[:data].count).to eq(3)
    expect(results[:data][0]).to have_key('name')
    expect(results[:data][0]).to have_key('address')
  end
end
