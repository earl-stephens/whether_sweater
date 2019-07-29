# frozen_string_literal: true

# DarkSky service class
class DarkSkyService

  def initialize(location)
    @location = location
  end

  def find_lat
    service_coords["lat"].to_i
  end

  def find_long
    service_coords["lng"].to_i
  end

  def conn
    Faraday.new("https://api.darksky.net") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def weather_data
    response = conn.get("/forecast/8908e62bdbb5d7e5e40bcbf853556d2c/47.6,-122.5")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def service
    @_service ||= GoogleGeocodeService.new
  end

  def service_coords
    @_service_coords ||= service.find_coords(@location)
  end

end
