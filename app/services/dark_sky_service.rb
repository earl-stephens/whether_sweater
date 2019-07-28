# frozen_string_literal: true

# DarkSky service class
class DarkSkyService

  def initialize(location)
    @location = location
  end

  def find_lat
    service_coords["results"]["geometry"]["location"]["lat"].to_i
  end

  def find_long
    service_coords["results"]["geometry"]["location"]["lng"].to_i
  end

  def weather_data

  end

  private

  def service
    @_service ||= GoogleGeocodeService.new
  end

  def service_coords
    @_service_coords ||= service.find_coords(@location)
  end

end
