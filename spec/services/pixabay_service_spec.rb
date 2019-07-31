require "rails_helper"

describe 'pixabay service' do
  it 'can edit location info' do
    location = 'San Diego,CA'

    pic_service = PixabayService.new

    expected = 'San+Diego'

    expect(pic_service.edited_location(location)).to eq(expected)
  end

  it 'can get an image' do
    VCR.use_cassette('pixabay_picture') do
      location = 'San Francisco,ca'
      pic_service = PixabayService.new

      results = pic_service.city_image(location)

      expect(results).to be_a Hash
      expect(results).to have_key(:totalHits)
      expect(results).to have_key(:hits)
    end
  end
end
