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

  def get_time(start, ending)
    starting_location = format_address(start)
    ending_location = format_address(ending)
    response = conn.get("/maps/api/directions/json?origin=#{starting_location}&destination=#{ending_location}&key=#{ENV['GOOGLE_API_KEY']}")
    results = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end

end
