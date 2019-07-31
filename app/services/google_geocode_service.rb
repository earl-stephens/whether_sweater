# frozen_string_literal: true

# google geocode service class
class GoogleGeocodeService
  def conn
    Faraday.new('https://maps.googleapis.com') do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def find_coords(location)
    Rails.cache.fetch("#{location}", expires_in: 15.minutes) do
      formatted_address = format_address(location)
      response = conn.get('/maps/api/geocode/'\
        "json?key=#{ENV['GOOGLE_API_KEY']}&address=#{formatted_address}")
      JSON.parse(response.body, symbolize_names: true)
    end
  end

  def get_time(start, ending)
    Rails.cache.fetch("#{start},#{ending}", expires_in: 15.minutes) do
      response = conn.get('/maps/api/directions/'\
        "json?origin=#{start}&destination=#{ending}"\
        "&key=#{ENV['GOOGLE_API_KEY']}")
      results = JSON.parse(response.body, symbolize_names: true)
      results[:routes][0][:legs][0][:duration][:value]
    end
  end

  def format_address(location)
    first_format = location.gsub(',', '+')
    first_format.gsub(' ', '+')
  end
end
