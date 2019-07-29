# frozen_string_literal: true

# google geocode service class
class GoogleGeocodeService

  def conn
    Faraday.new("https://maps.googleapis.com") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def find_coords(location)
    formatted_address = format_address(location)
    response = conn.get("/maps/api/geocode/json?key=#{ENV['GOOGLE_API_KEY']}&address=#{formatted_address}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def format_address(location)
    first_format = location.gsub(',', '+')
    second_format = first_format.gsub(' ', '+')
  end

end
