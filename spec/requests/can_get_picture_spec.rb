require "rails_helper"

describe 'user can request', type: :request do
  it 'a background picture' do
    get '/api/v1/backgrounds?location=miami,fl'

    results = JSON.parse(response.body)
    expect(response).to be_successful

    expect(results["hits"][0]["largeImageURL"]).to be_a String
  end
end
