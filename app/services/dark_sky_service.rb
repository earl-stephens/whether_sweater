# frozen_string_literal: true

# DarkSky service class
class DarkSkyService
  def initialize(location)
    @location = location
  end

  def find_lat
    service_coords['lat'].to_i
  end

  def find_long
    service_coords['lng'].to_i
  end

  def conn
    Faraday.new('https://api.darksky.net') do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def weather_data
    lat = find_lat
    long = find_long
    Rails.cache.fetch("#{lat},#{long}", :expires_in => 15.minutes) do
      response = conn.get('/forecast/'\
        "#{ENV['DARKSKY_KEY']}/#{lat},#{long}")
      JSON.parse(response.body, symbolize_names: true)
    end
  end

  private

  def service
    @_service ||= GoogleGeocodeService.new
  end

  def service_coords
    @_service_coords ||= service.find_coords(@location)
  end
end
