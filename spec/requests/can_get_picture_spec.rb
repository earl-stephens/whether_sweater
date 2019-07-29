require "rails_helper"

describe 'user can request', type: :request do
  it 'a background picture' do
    get '/api/v1/backgrounds?location=melbourne,fl'

    results = JSON.parse(response.body)
    expect(response).to be_successful

    expect(results).to be_a Hash
    expect(results["data"]["attributes"]["image_url"]).to be_a String
  end
end
