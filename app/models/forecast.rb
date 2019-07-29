# frozen_string_literal: true

# forecast model class
class Forecast
  attr_reader :id,
              :location,
              :current,
              :hourly,
              :daily

  def initialize(location)
    @id = location
    @location = location
    @current = current
    @hourly = hourly
    @daily = daily
  end

  def current
    {
      "time" => service_data[:currently][:time],
      "summary" => service_data[:currently][:summary],
      "icon" => service_data[:currently][:icon],
      "temperature" => service_data[:currently][:temperature],
      "feels_like" => service_data[:currently][:apparentTemperature],
      "humidity" => service_data[:currently][:humidity],
      "uv_index" => service_data[:currently][:uvIndex],
      "visibility" => service_data[:currently][:visibility],
      "hi_temp" => service_data[:daily][:temperatureHigh],
      "lo_temp" => service_data[:currently][:temperatureLow]
    }
  end

  def hourly
    service_data[:hourly][:data].map do |datum|
      {
        "time" => datum[:time],
        "summary" => datum[:summary],
        "icon" => datum[:icon],
        "temperature" => datum[:temperature]
      }
    end
  end
 
  def daily
    service_data[:daily][:data].map do |datum|
      {
        "icon" => datum[:icon],
        "percent_precip" => datum[:precipProbability],
        "precip_type" => datum[:precipType],
        "hi_temp" => datum[:temperatureHigh],
        "lo_temp" => datum[:temperatureLow],
        "time" => datum[:time]
      }
    end
  end

  private

  def service
    @_service ||= DarkSkyService.new(@location)
  end

  def service_data
    @_service_data ||= service.weather_data
  end

end
